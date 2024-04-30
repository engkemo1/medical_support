import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          AppRouter.router(
            const RouteSettings(
              name: AppRouter.kMedicinesView,
            ),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 180.w,
            height: 220.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 0.0001,
                  blurRadius: 10,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: const Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الجهاز الهضمي",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            Assets.test,
            fit: BoxFit.fill,
            height: 140.h,
            width: 182.w,
          ),
        ],
      ),
    );
  }
}
