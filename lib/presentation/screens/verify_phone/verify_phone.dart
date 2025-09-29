import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';
import 'package:grabber_grocery_app/presentation/widgets/otp_fildes.dart';

class VerifyPhone extends StatelessWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify your phone number"),
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
                  "Enter your OTP code here ",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),

          OtpFields(),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.049),
              Text(
                "Didn’t receive the OTP?",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: width * 0.045,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend",
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: width * 0.045,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          SizedBox(
            width: width * 0.80,
            height: height * 0.050,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "password confirm");
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.main),
              child: Text(
                "Verify",
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
