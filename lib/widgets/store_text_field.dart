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
    return TextField(
      controller: widget.emailController,
      obscureText: widget.isVisible && widget.isPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: widget.isVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
