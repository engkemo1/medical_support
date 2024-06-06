import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';

class LogInSection extends StatefulWidget {
  const LogInSection({super.key});

  @override
  State<LogInSection> createState() => _LogInSectionState();
}

class _LogInSectionState extends State<LogInSection> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          const CustomTextField(
            keyboardType:
            TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email_outlined,
            ),
            labelText: 'البريد الالكترونى',
          ),
          SizedBox(
            height: 10.h,
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
            height: 50.h,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'هل نسيت كلمة المرور ؟',
                    style: Styles.textStyle16,
                  )),
              Row(
                children: [
                  Checkbox(
                    value: check,
                    onChanged: (bool? value) {
                      check == true
                          ? check = false
                          : check = true;
                      setState(() {});
                    },
                  ),
                  const Text(
                    "تذكرنى",
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
