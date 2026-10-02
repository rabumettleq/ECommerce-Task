import 'package:flutter/material.dart';

class StoreBottomNavigation extends StatelessWidget {
  String selectedItem;

  StoreBottomNavigation({
    super.key,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border(
          top: BorderSide(
            color: Color(0xffE6E6E6),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bottomItem(
              icon: Icons.home_outlined,
              text: 'Home',
              selected: selectedItem == 'Home',
              onTap: () {
                if (selectedItem != 'Home') {
                  Navigator.pushReplacementNamed(
                    context,
                    '/home_screen',
                  );
                }
              },
            ),

            SizedBox(width: 40),

            _bottomItem(
              icon: Icons.shopping_cart_outlined,
              text: 'Cart',
              selected: selectedItem == 'Cart',
              onTap: () {
                if (selectedItem != 'Cart') {
                  Navigator.pushNamed(
                    context,
                    '/cart_screen',
                  );
                }
              },
            ),

            SizedBox(width: 40),

            _bottomItem(
              icon: Icons.person_outline,
              text: 'Account',
              selected: selectedItem == 'Account',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomItem({
    required IconData icon,
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    Color itemColor = selected
        ? Color(0xff3669C9)
        : Color(0xff999999);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: itemColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Readex Pro',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.4,
              color: itemColor,
            ),
          ),
        ],
      ),
    );
  }
}