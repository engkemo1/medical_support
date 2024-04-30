import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/features/home/presentation/views/widgets/bottom_navigation_bar_body.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarBody(),
      body: Column(
        children: [
          const CustomAppBar(title: "التفاصيل"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Assets.enzymaxTest,
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Enzymax",
                      style: Styles.textStyle35.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "المرض : اجهاز الهضمي ",
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "الوصف : لعلج مشاكل عسر العضم",
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "السعر ",
                      style: Styles.textStyle28.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "80 L.E ",
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyle28.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "بعد الخصم",
                      style: Styles.textStyle28.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "60 L.E ",
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyle28.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
