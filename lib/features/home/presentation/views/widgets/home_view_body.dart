import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        SizedBox(
          height: double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
            child: const GridViewBuilder(),
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
