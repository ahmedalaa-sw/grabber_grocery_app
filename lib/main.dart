import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRoot();
  }
}
