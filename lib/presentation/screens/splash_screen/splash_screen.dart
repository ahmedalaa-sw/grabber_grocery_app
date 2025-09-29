import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
        child: Text(
          "E-Commerce",
          style: TextStyle(
            color: AppColors.main,
            fontSize: width * 0.1,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
