import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/store_header.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  String getPrice(Product product) {
    return '\$ ${product.price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    final product =
    ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 59,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    StoreHeader(title: 'Details'),

                    SizedBox(height: 20),

                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 341,
                        height: 368.53,
                        child: Image.asset(
                          product.imagePath,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // Product Name
                    Text(
                      product.name,
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        letterSpacing: 0,
                        color: Color(0xff1A1A1A),
                      ),
                    ),

                    SizedBox(height: 13),

                    // Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18.85,
                          color: Color(0xffFFA928),
                        ),

                        SizedBox(width: 6),

                        Text(
                          '4.0/5 (45 reviews)',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                            letterSpacing: 0,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 13),

                    // Product Description
                    Text(
                      product.details,
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        letterSpacing: 0,
                        color: Color(0xff808080),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Section
          Container(
            width: double.infinity,
            height: 105,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              border: Border(
                top: BorderSide(
                  color: Color(0xffE6E6E6),
                  width: 1,
                ),
              ),
            ),
            child: Stack(
              children: [
                // Price
                Positioned(
                  left: 24,
                  top: 22,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          letterSpacing: 0,
                          color: Color(0xff808080),
                        ),
                      ),

                      Text(
                        getPrice(product),
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          letterSpacing: 0,
                          color: Color(0xff1A1A1A),
                        ),
                      ),
                    ],
                  ),
                ),

                // Add to Cart Button
                Positioned(
                  top: 20,
                  left: 125,
                  right: 24,
                  height: 54,
                  child: GestureDetector(
                    onTap: () {
                      int index = cartProducts.indexWhere(
                            (item) =>
                        item.name == product.name &&
                            item.size == product.size,
                      );

                      if (index != -1) {
                        cartProducts[index].quantity++;
                      } else {
                        cartProducts.add(product);
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3669C9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 24,
                            color: Color(0xffFFFFFF),
                          ),

                          SizedBox(width: 10),

                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                              letterSpacing: 0,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}