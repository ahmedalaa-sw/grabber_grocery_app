import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';
import 'package:grabber_grocery_app/presentation/widgets/custom_text_field.dart';

class PasswordConfirm extends StatelessWidget {
  const PasswordConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // final passwordCubit = context.read<PasswordVisibilityCubit>();

    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("password confirm"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: height * 0.03),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: width * 0.9,
                child: Text(
                  "Enter new password and confirm  ",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: width * 0.95,
              child: CustomTextField(
                label: "Password",
                hint: "Enter your password",
                isPassword: true,
                showVisibilityToggle: true,
                controller: passwordController,
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: width * 0.95,
              child: CustomTextField(
                label: "Password Confirm",
                hint: "Re-Enter your password",
                isPassword: true,
                showVisibilityToggle: true,
                controller: passwordController,
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            width: width * 0.95,
            height: height * 0.065,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  "password reset success",
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.main),
              child: Text(
                "CHANGE PASSWORD",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: width * 0.055,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
