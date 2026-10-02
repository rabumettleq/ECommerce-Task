import 'package:flutter/material.dart';

class StoreHeader extends StatelessWidget {
  String title;

  StoreHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Color(0xff1A1A1A),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.2,
                letterSpacing: 0,
                color: Color(0xff1A1A1A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}