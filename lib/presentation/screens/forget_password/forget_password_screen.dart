import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';
import 'package:grabber_grocery_app/presentation/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.03),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: width * 0.9,
                child: Text(
                  "Please enter your email address. You will receive a link to create a new password via email.",
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
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              width: width * 0.95,
              child: CustomTextField(
                label: "email",
                hint: "oady@test.com",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          SizedBox(
            width: width * 0.90,
            height: height * 0.050,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "verify phone");
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.main),
              child: Text(
                "Send",
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
