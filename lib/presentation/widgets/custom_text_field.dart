import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool showVisibilityToggle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.showVisibilityToggle = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, isObscured, child) {
        return TextFormField(
          controller: controller,
          obscureText: isPassword && isObscured,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: const TextStyle(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: AppColors.main),
            ),
            suffixIcon: showVisibilityToggle
                ? IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.main,
                    ),
                    onPressed: () => _obscureTextNotifier.value = !isObscured,
                  )
                : null,
          ),
        );
      },
    );
  }

  static final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(
    true,
  );
}
