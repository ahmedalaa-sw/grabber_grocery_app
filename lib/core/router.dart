import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/presentation/screens/alyscreen.dart';
import 'package:grabber_grocery_app/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:grabber_grocery_app/presentation/screens/login_screen/login_screen.dart';
import 'package:grabber_grocery_app/presentation/screens/password_confirm/password_confirm.dart';
import 'package:grabber_grocery_app/presentation/widgets/otp_fildes.dart';
import 'package:grabber_grocery_app/presentation/screens/verify_phone/verify_phone.dart';
import 'package:grabber_grocery_app/presentation/screens/register_screen/register_screen.dart';
import 'package:grabber_grocery_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:grabber_grocery_app/presentation/screens/password_reset_success/password_reset_success_screen.dart';
import 'package:grabber_grocery_app/presentation/screens/home_screen/home_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // here we will let the app theme to be the same as the system theme
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,

      initialRoute: 'aly',
      routes: {
        "splash": (context) => const SplashScreen(),
        "login": (context) => const LoginScreen(),
        "register": (context) => const RegisterScreen(),
        "forget pass": (context) => const ForgetPasswordScreen(),
        "otp fields": (context) => const OtpFields(),
        "verify phone": (context) => const VerifyPhone(),
        "password confirm": (context) => const PasswordConfirm(),
        "password reset success": (context) =>
            const PasswordResetSuccessScreen(),
        "home": (context) => HomeScreen(),
        "aly": (context) => const Alyscreen(),
      },
    );
  }
}
