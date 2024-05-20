import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';
import 'grid_view_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 8.sp, right: 8.0.sp, top: 85.sp),
            child: Column(
              children: [
                const CustomTextField(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    keyboardType: TextInputType.text,
                    labelText: "البحث"),
                SizedBox(
                  height: 10.h,
                ),
                const GridViewBuilder(),
              ],
            ),
          ),
        ),
        const Column(
          children: [
            CustomAppBar(title: "الاقسام"),
          ],
        ),
      ]),
    );
  }
}
