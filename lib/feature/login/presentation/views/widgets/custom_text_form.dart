import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.label,
      this.validator,
      this.controller,
      this.obscureText = false});
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Widget? label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Feild required';
        } else
          return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        label: label,
        floatingLabelStyle: const TextStyle(color: Colors.black, fontSize: 20),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        enabledBorder: textFieldBorder(),
        border: textFieldBorder(),
        focusedBorder:
            textFieldBorder().copyWith(borderSide: const BorderSide(width: 1)),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(width: .5, color: Colors.black),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }
}
