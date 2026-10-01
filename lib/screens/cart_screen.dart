import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getTotal() {
    double total = 0;

    for (Product product in cartProducts) {
      total += product.price * product.quantity;
    }

    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      cartProducts[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartProducts[index].quantity > 1) {
        cartProducts[index].quantity--;
      }
    });
  }

  void deleteProduct(int index) {
    setState(() {
      cartProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('My Cart'),
      ),
      body: cartProducts.isEmpty
          ? Center(
        child: Text('Your cart is empty'),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                Product product = cartProducts[index];

                return ListTile(
                  leading: Image.asset(
                    product.imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    '\$ ${product.price.toStringAsFixed(0)}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          decreaseQuantity(index);
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text('${product.quantity}'),
                      IconButton(
                        onPressed: () {
                          increaseQuantity(index);
                        },
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteProduct(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$ ${getTotal().toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}