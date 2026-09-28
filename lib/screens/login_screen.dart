import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/widgets/store_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 59, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log in to your account ',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
              ),
            ),
            Gap(8),
            Text(
              'It’s great to see you again.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(24),
            Text(
              'Email ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Gap(4),
            StoreTextField(
              emailController: emailController,
              hintText: 'Enter your Email',
            ),
            Gap(16),
            Text(
              'Password ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Gap(4),
            StoreTextField(
              isPassword: true,
              emailController: passwordController,
              hintText: 'Password',
              suffixIcon: Icon(Icons.visibility),
            ),
            Gap(55),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home_screen');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,

                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account ? "),
                  Gap(1),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Create account .',
                      style: TextStyle(color: Colors.blue, fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
