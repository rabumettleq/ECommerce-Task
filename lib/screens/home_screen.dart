import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  List<Product> products =[
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
    Product(price: 15, imagePath: 'assets/images/image.png', name: 'sdfdsf', details: 'sdfsd', quantity: 15, size: 'adf'),
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ProductWidget(product: products[index],),
        );
      }),
    );
  }
}
