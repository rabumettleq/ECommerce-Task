import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/models/product.dart';

class ProductWidget extends StatelessWidget {
  Product product;

  ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        height: 107,
        width: double.infinity,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(product.imagePath),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding:  EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),),
                      Gap(80),
                      Icon(Icons.restore_from_trash_outlined , color: Colors.red,)
                    ],
                  ),
                  
                ),
                Text(product.size),
                Row(
                  children: [
                    Text('${product.price}')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
