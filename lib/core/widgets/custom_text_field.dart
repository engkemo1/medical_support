import 'package:flutter/material.dart';
import 'package:medical_support/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.prefixIcon,
    this.onChanged,
    this.onSaved,
    required this.keyboardType,
    this.obscureText = false,
    required this.labelText,
  });

  final Widget prefixIcon;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;

  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: labelText,
        suffixIconColor: kGreyColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
