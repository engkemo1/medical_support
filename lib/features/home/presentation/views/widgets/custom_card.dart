import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/model/category_model.dart';
import 'package:medical_support/model/product_model.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_cubit.dart';

import '../medicines_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<ProductModel> list = [];
        CategoryCubit().getSubCategory().then((value) {
          list = value
              .where((e) => e.categoryId.toString() == categoryModel.id.toString())
              .toList();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MedicinesView(
                        products: list,
                        title: categoryModel.name.toString(),
                      )));
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 180.w,
            height: 220.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(categoryModel.name.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20),
                  ],
                ),
              ),
            ),
          ),
          Image.network(
            categoryModel.image.toString(),
            errorBuilder: (context, e, o) => Image.asset(
              Assets.logo,
              fit: BoxFit.fill,
              height: 140.h,
              width: 182.w,
            ),
            fit: BoxFit.fill,
            height: 140.h,
            width: 182.w,
          ),
        ],
      ),
    );
  }
}
