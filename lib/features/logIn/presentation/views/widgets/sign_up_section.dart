import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          const CustomTextField(
            keyboardType: TextInputType.text,
            prefixIcon: Icon(
              Icons.person_outline,
            ),
            labelText: 'الاسم',
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomTextField(
            keyboardType:
            TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email_outlined,
            ),
            labelText: 'البريد الالكترونى',
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomTextField(
            obscureText: true,
            keyboardType:
            TextInputType.visiblePassword,
            prefixIcon: Icon(
              Icons.key_outlined,
            ),
            labelText: 'كلمة السر ',
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomTextField(
            keyboardType: TextInputType.phone,
            prefixIcon: Icon(
              Icons.phone_outlined,
            ),
            labelText: 'الهاتف',
          ),
        ],
      ),
    );
  }
}
