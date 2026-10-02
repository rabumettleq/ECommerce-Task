import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/product_widget.dart';
import 'package:store/widgets/store_header.dart';
import 'package:store/widgets/store_bottom_navigation.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getSubTotal() {
    double total = 0;

    for (Product product in cartProducts) {
      total += product.price * product.quantity;
    }

    return total;
  }

  double getShippingFee() {
    if (cartProducts.isEmpty) {
      return 0;
    }

    return 80;
  }

  double getTotal() {
    return getSubTotal() + getShippingFee();
  }

  String formatPrice(double price) {
    return '\$ ${price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
    )}';
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
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 59,
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  // Header
                  StoreHeader(title: 'My Cart'),

                  SizedBox(height: 20),

                  // Products
                  if (cartProducts.isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff808080),
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: cartProducts.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
                        itemBuilder: (context, index) {
                          Product product = cartProducts[index];

                          return ProductWidget(
                            product: product,
                            onIncrease: () {
                              increaseQuantity(index);
                            },
                            onDecrease: () {
                              decreaseQuantity(index);
                            },
                            onDelete: () {
                              deleteProduct(index);
                            },
                          );
                        },
                      ),
                    ),

                  // Order Summary
                  if (cartProducts.isNotEmpty)
                    Column(
                      children: [
                        _summaryRow(
                          'Sub-total',
                          formatPrice(getSubTotal()),
                          false,
                        ),

                        SizedBox(height: 16),

                        _summaryRow(
                          'VAT (%)',
                          '\$ 0.00',
                          false,
                        ),

                        SizedBox(height: 16),

                        _summaryRow(
                          'Shipping fee',
                          formatPrice(getShippingFee()),
                          false,
                        ),

                        SizedBox(height: 16),

                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Color(0xffE6E6E6),
                        ),

                        SizedBox(height: 15),

                        _summaryRow(
                          'Total',
                          formatPrice(getTotal()),
                          true,
                        ),

                        SizedBox(height: 51),

                        // Checkout Button
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Color(0xff3669C9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Go To Checkout',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                    letterSpacing: 0,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),

                                SizedBox(width: 10),

                                Icon(
                                  Icons.arrow_forward,
                                  size: 24,
                                  color: Color(0xffFFFFFF),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                ],
              ),
            ),
          ),

          // Bottom Navigation
          StoreBottomNavigation(
            selectedItem: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
      String title,
      String value,
      bool isTotal,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Readex Pro',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4,
            letterSpacing: 0,
            color: isTotal
                ? Color(0xff1A1A1A)
                : Color(0xff808080),
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Readex Pro',
            fontSize: 16,
            fontWeight:
            isTotal ? FontWeight.w600 : FontWeight.w500,
            height: 1.4,
            letterSpacing: 0,
            color: Color(0xff1A1A1A),
          ),
        ),
      ],
    );
  }
}