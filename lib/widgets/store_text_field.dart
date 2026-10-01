import 'package:flutter/material.dart';

class StoreTextField extends StatefulWidget {
  bool isPassword;
  TextEditingController emailController;
  bool isVisible;
  String hintText;
  Widget? suffixIcon;

  StoreTextField({
    super.key,
    required this.emailController,
    required this.hintText,
    this.suffixIcon,
    this.isPassword = false,
    this.isVisible = true,
  });

  @override
  State<StoreTextField> createState() => _StoreTextFieldState();
}

class _StoreTextFieldState extends State<StoreTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextField(
        controller: widget.emailController,
        obscureText: widget.isVisible && widget.isPassword,

        style: TextStyle(
          fontFamily: 'Readex Pro',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: Color(0xff1A1A1A),
        ),

        decoration: InputDecoration(
          hintText: widget.hintText,

          hintStyle: TextStyle(
            fontFamily: 'Readex Pro',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4,
            color: Color(0xff999999),
          ),

          contentPadding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 14,
            bottom: 14,
          ),

          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              setState(() {
                widget.isVisible = !widget.isVisible;
              });
            },
            icon: Icon(
              widget.isVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 19.69,
              color: Color(0xff999999),
            ),
          )
              : null,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xffE6E6E6),
              width: 1,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xffE6E6E6),
              width: 1,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xffE6E6E6),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}