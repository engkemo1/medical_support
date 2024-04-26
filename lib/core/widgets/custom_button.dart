import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 62,
      minWidth: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.sp),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle24.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
