import 'package:flutter/material.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/widgets/custom_button.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "ابداء الان",
      onPressed: () {
        Navigator.pushReplacement(
          context,
          AppRouter.router(
            const RouteSettings(name: AppRouter.kLogoView),
          ),
        );
        CacheHelper().put(key: "onBoarding", value: true);
      },
    );
  }
}
