import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'on_boarding_button.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              Assets.onBoarding,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text(
              "نتمنى لك زيارة سعيدة",
              style: Styles.textStyle35.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "خدمتنا 24 ساعة لك ",
              style:
                  Styles.textStyle24.copyWith(color: const Color(0xff7C7C7C)),
            ),
            SizedBox(
              height: 40.sp,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: OnBoardingButton(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
