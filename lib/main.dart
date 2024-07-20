import 'package:e_commerce_exam/view/cartpage.dart';
import 'package:e_commerce_exam/view/detailpage.dart';
import 'package:e_commerce_exam/view/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        'home_page': (context) => const Homepage(),
        'detail_page': (context) => const Detailpage(),
        'CartPage': (context) => CartPage(),
      },
    );
  }
}
