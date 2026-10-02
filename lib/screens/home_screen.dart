import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/product_widget.dart';
import 'package:store/widgets/store_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 1;

  List<String> categories = [
    'All',
    'Tshirts',
    'Jeans',
    'Shoes',
  ];

  List<Product> products = [
    Product(
      price: 1190,
      imagePath: 'assets/images/image.png',
      name: 'Regular Fit Slogan',
      details: 'Regular Fit Slogan',
      quantity: 2,
      size: 'L',
    ),
    Product(
      price: 1100,
      imagePath: 'assets/images/image-1.png',
      name: 'Regular Fit Polo',
      details: 'Regular Fit Polo',
      quantity: 1,
      size: 'M',
    ),
    Product(
      price: 1190,
      imagePath: 'assets/images/image.png',
      name: 'Regular Fit Slogan',
      details: 'Regular Fit Slogan',
      quantity: 2,
      size: 'L',
    ),
    Product(
      price: 1100,
      imagePath: 'assets/images/image-1.png',
      name: 'Regular Fit Polo',
      details: 'Regular Fit Polo',
      quantity: 1,
      size: 'M',
    ),
    Product(
      price: 1190,
      imagePath: 'assets/images/image.png',
      name: 'Regular Fit Slogan',
      details: 'Regular Fit Slogan',
      quantity: 2,
      size: 'L',
    ),
    Product(
      price: 1100,
      imagePath: 'assets/images/image-1.png',
      name: 'Regular Fit Polo',
      details: 'Regular Fit Polo',
      quantity: 1,
      size: 'M',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 59,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: -1.6,
                        color: Color(0xff1A1A1A),
                      ),
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xffE6E6E6),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 24,
                                  color: Color(0xff999999),
                                ),
                                suffixIcon: Icon(
                                  Icons.mic_none,
                                  size: 24,
                                  color: Color(0xff999999),
                                ),
                                hintText: 'Search for clothes...',
                                hintStyle: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 8),

                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xff3669C9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.tune,
                            size: 24,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                        categories.length,
                            (index) {
                          bool isSelected =
                              selectedCategory == index;

                          double width;

                          if (index == 0) {
                            width = 60;
                          } else if (index == 1) {
                            width = 92;
                          } else if (index == 2) {
                            width = 86;
                          } else {
                            width = 87;
                          }

                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = index;
                                  });
                                },
                                child: Container(
                                  width: width,
                                  height: 36,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Color(0xff3669C9)
                                        : Color(0xffFFFFFF),
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                      color: isSelected
                                          ? Color(0xff3669C9)
                                          : Color(0xffE6E6E6),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                      color: isSelected
                                          ? Color(0xffFFFFFF)
                                          : Color(0xff1A1A1A),
                                    ),
                                  ),
                                ),
                              ),

                              if (index != categories.length - 1)
                                SizedBox(width: 8),
                            ],
                          );
                        },
                      ),
                    ),
                ),

                    SizedBox(height: 16),

                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: products.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/details_screen',
                                arguments: products[index],
                              );
                            },
                            child: ProductWidget(
                              product: products[index],

                              onIncrease: () {
                                setState(() {
                                  products[index].quantity++;
                                });
                              },

                              onDecrease: () {
                                setState(() {
                                  if (products[index].quantity > 1) {
                                    products[index].quantity--;
                                  }
                                });
                              },

                              onDelete: () {
                                setState(() {
                                  products.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            StoreBottomNavigation(
              selectedItem: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}