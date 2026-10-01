import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/widgets/store_text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 59,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an account',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 32,
                fontWeight: FontWeight.w600,
                height: 1,
                letterSpacing: -1.6,
                color: Color(0xff1A1A1A),
              ),
            ),

            Gap(8),

            Text(
              'Let’s create your account.',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: Color(0xff808080),
              ),
            ),

            Gap(24),

            Text(
              'Full Name',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: Color(0xff1A1A1A),
              ),
            ),

            Gap(4),

            StoreTextField(
              emailController: nameController,
              hintText: 'Enter your full name',
            ),

            Gap(16),

            Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: Color(0xff1A1A1A),
              ),
            ),

            Gap(4),

            StoreTextField(
              emailController: emailController,
              hintText: 'Enter your email address',
            ),

            Gap(16),

            Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: Color(0xff1A1A1A),
              ),
            ),

            Gap(4),

            StoreTextField(
              isPassword: true,
              emailController: passwordController,
              hintText: 'Enter your password',
            ),

            Gap(42),

            Text(
              'Confirm Password',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: Color(0xff1A1A1A),
              ),
            ),

            Gap(4),

            StoreTextField(
              isPassword: true,
              emailController: confirmPasswordController,
              hintText: 'Enter your password',
            ),

            Gap(42),

            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/home_screen',
                  );
                },
                child: Container(
                  width: 325,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff3669C9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 20 / 14,
                        letterSpacing: 0,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.only(
                bottom: 45,
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        letterSpacing: -0.32,
                        color: Color(0x99000000),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          color: Color(0xff1A1A1A),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}