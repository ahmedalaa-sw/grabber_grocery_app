import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      // backgroundColor: const Color(0xFFF8F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),

            // Success Image
            SizedBox(
              width: width * 0.42,
              height: width * 0.42,
              child: Image.asset(
                'assets/images/password reset.png',
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: height * 0.04),

            // Success Message
            Text(
              'Your password has\nbeen reset!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.w600,
                color: AppColors.main,
                height: 1.3,
              ),
            ),

            SizedBox(height: height * 0.04),

            // DONE Button
            SizedBox(
              width: double.infinity,
              height: height * 0.065,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.main,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * 0.065 / 2),
                  ),
                ),
                child: const Text(
                  'DONE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.04 * 1.2),
          ],
        ),
      ),
    );
  }
}
