import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/features/logIn/presentation/views/log_in_view.dart';
import 'package:medical_support/features/logIn/presentation/views/logo_view.dart';
import 'package:medical_support/features/onBoarding/presentation/view/on_boarding_view.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final bool onBoarding = CacheHelper().getData(key: "onBoarding") ?? false;

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 100.w,
      gradientBackground: const LinearGradient(
          colors: [Color(0xffAC7EBC), Color(0xff436973)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      title: Text(
        "MEDICAL SUPPORT",
        style: Styles.textStyle28.copyWith(color: kSecondaryColor),
      ),
      logo: Image.asset(
        Assets.logo,
        fit: BoxFit.cover,
        width: 130.w,
      ),
      showLoader: false,
      navigator: onBoarding ? const LogoView() : const OnBoardingView(),
      durationInSeconds: 3,
    );
  }
}
