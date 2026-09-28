import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        leading: Icon(Icons.arrow_back),
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text('${name['age']}'),
              Image.asset('assets/images/image.png', width: 368, height: 341),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Fit Polo T Shirt',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffFFA928), size: 18),
                  SizedBox(width: 6),
                  Text(
                    '4.0/5',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    '  (45 Reviews)',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 13),
              Text(
                'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Spacer(),
              Container(width: double.infinity, height: 1, color: Colors.grey),
              SizedBox(height: 22),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '\$ 1.192',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login_screen');
                    },
                    child: Container(
                      width: 240,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Color(0xff3669C9),
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add to card',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
