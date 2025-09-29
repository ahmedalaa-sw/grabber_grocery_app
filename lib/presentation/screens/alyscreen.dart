import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/main.dart' as AppColors;

class Alyscreen extends StatefulWidget {
  const Alyscreen({super.key});

  @override
  State<Alyscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<Alyscreen> {
  @override
  @override
  void initState() {
    super.initState();

    // الانتقال بعد 3 ثواني
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "login");
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: width * 0.42,
          height: width * 0.42,
          child: Image.asset(
            'assets/images/password reset.png',
            fit: BoxFit.contain,
          ),
        )
      ),
    );
  }
}
