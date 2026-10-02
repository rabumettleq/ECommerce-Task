import 'package:flutter/material.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/details_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/login_screen.dart';
import 'package:store/screens/create_account_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: '/login_screen',
        routes: {
          '/details_screen' : (context) => DetailsScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/home_screen': (context) => HomeScreen(),
          '/create_account_screen': (context) => CreateAccountScreen(),
          '/cart_screen': (context) => CartScreen(),
        },
        );
  }
}
