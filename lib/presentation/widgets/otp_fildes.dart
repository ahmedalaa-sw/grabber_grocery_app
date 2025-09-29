import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.17, // عرض ثابت
            height: width * 0.17, // نفس العرض علشان يبقى دائرة
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300], // الخلفية الرمادي
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000), // دائرة بالكامل
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: const BorderSide(color: AppColors.main, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.17, // عرض ثابت
            height: width * 0.17, // نفس العرض علشان يبقى دائرة
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300], // الخلفية الرمادي
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000), // دائرة بالكامل
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: const BorderSide(color: AppColors.main, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.17, // عرض ثابت
            height: width * 0.17, // نفس العرض علشان يبقى دائرة
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300], // الخلفية الرمادي
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000), // دائرة بالكامل
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: const BorderSide(color: AppColors.main, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.17, // عرض ثابت
            height: width * 0.17, // نفس العرض علشان يبقى دائرة
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300], // الخلفية الرمادي
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000), // دائرة بالكامل
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: const BorderSide(color: AppColors.main, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Scaffold(
    //       appBar: AppBar(
    //         title: Text("Verify your phone number"),
    //         centerTitle: true,
    //       ),
    //       body: Column(
    //         children: [
    //           SizedBox(height: height * 0.03),
    //           SizedBox(
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 17.0),
    //               child: SizedBox(
    //                 width: width * 0.9,
    //                 child: Text(
    //                   "enter your OTP code here ",
    //                   style: TextStyle(
    //                     fontSize: width * 0.04,
    //                     fontWeight: FontWeight.w400,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
  }
}
