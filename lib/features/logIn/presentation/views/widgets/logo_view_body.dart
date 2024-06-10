import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_button.dart';
import 'package:medical_support/features/doctor/doctor.dart';

class LogoViewBody extends StatelessWidget {
  const LogoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16.h),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.backgroundLogo,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "هل تريد تسجيل الدخول ك..؟",
            style: Styles.textStyle28.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          CustomButton(
              text: "صيدلية",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  AppRouter.router(
                    const RouteSettings(name: AppRouter.kLogInView),
                  ),
                );
              }),
          SizedBox(
            height: 40.h,
          ),
          CustomButton(
              text: "طبيب",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Doctor()));
              }),
        ],
      ),
    );
  }
}
