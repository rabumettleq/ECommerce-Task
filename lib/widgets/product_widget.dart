import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  VoidCallback onIncrease;
  VoidCallback onDecrease;
  VoidCallback onDelete;

  ProductWidget({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  String getPrice() {
    return '\$ ${product.price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 107,
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 14,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffE6E6E6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              width: 83,
              height: 79,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(width: 16),

          Expanded(
            child: SizedBox(
              height: 79,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: Color(0xff1A1A1A),
                              ),
                            ),

                            SizedBox(height: 1),

                            Text(
                              'Size ${product.size}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                color: Color(0xff808080),
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: onDelete,
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: Icon(
                            Icons.delete_outline,
                            size: 16,
                            color: Color(0xffED1010),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getPrice(),
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: Color(0xff1A1A1A),
                        ),
                      ),

                      SizedBox(
                        width: 72.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: onDecrease,
                              child: Container(
                                width: 23.75,
                                height: 22.37,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius:
                                  BorderRadius.circular(2.97),
                                  border: Border.all(
                                    color: Color(0xffCCCCCC),
                                    width: 0.64,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Color(0xff1A1A1A),
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              '${product.quantity}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                                color: Color(0xff1A1A1A),
                              ),
                            ),

                            GestureDetector(
                              onTap: onIncrease,
                              child: Container(
                                width: 23.75,
                                height: 22.37,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius:
                                  BorderRadius.circular(2.97),
                                  border: Border.all(
                                    color: Color(0xffCCCCCC),
                                    width: 0.64,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Color(0xff1A1A1A),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}