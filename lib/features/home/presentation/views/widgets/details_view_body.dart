import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/features/home/presentation/views/widgets/bottom_navigation_bar_body.dart';

import '../../../../../model/product_model.dart';

class DetailsViewBody extends StatelessWidget {
   DetailsViewBody({super.key,required this.productModel});
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBarBody(productModel: productModel,),
      body: ListView(
        children: [
          const CustomAppBar(title: "التفاصيل"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  productModel.image.toString(),
                  errorBuilder: (context , o , e)=>Image.asset(
                    Assets.logo,
                    width: 100,
                    height: 300,
                  ),
                  height: 300,
                ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productModel.name.toString(),
                      style: Styles.textStyle35.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                 Text(
                  " المرض : ${productModel.type}",
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  height: 10.h,
                ),
                 Text(
                  "الوصف : ${productModel.description}",
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
                      "${productModel.price} L.E ",
                      textDirection: TextDirection.ltr,
                      style: Styles.textStyle28.copyWith(
                        fontWeight: FontWeight.bold,
                        decorationColor: Colors.red,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
