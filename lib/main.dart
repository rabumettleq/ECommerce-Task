import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/screens/details_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/login_screen.dart';
import 'package:store/widgets/product_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: '/home_screen',
        routes: {
          '/details_screen' : (context) => DetailsScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/home_screen': (context) => HomeScreen()

        },
        );
  }
}
