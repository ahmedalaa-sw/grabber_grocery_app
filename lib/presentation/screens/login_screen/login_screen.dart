import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';
import 'package:grabber_grocery_app/cubit/login_cubit.dart';
import 'package:grabber_grocery_app/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordVisibilityCubit(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final passwordCubit = context.read<PasswordVisibilityCubit>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.050),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: width * 0.05),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.025),
            SizedBox(
              width: width * 0.95,
              child: CustomTextField(
                label: "email",
                hint: "oady@test.com",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              width: width * 0.95,
              child: CustomTextField(
                label: "Password",
                hint: "Enter your password",
                isPassword: true,
                showVisibilityToggle: true,
                controller: passwordController,
              ),
            ),
            SizedBox(height: height * 0.03),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "forget pass");
                },
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: width * 0.052,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: width * 0.80,
              height: height * 0.050,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "home");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.main,
                ),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: width * 0.055,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            Row(
              children: [
                SizedBox(width: width * 0.05),
                Text(
                  "don't have account",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: width * 0.045,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "register");
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: AppColors.main,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/facebook.png"),
                SizedBox(width: width * 0.050),
                Image.asset("assets/images/twitter.png"),
                SizedBox(width: width * 0.050),
                Image.asset("assets/images/google.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
