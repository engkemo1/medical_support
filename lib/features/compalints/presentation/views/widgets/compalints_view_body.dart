import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/view_model/cubit/compliants_cubit/compliants_cubit.dart';

class CompalintsViewBody extends StatelessWidget {
   CompalintsViewBody({
    super.key,
  });
TextEditingController compliantController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: "شكاوى ومقترحات",
            isBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      "اكتب شكوة",
                      style: Styles.textStyle24,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextField(
                      maxLines: 5,
                      controller:compliantController ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "اكتب هنا ......",
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const Text(
                      "هل لديك مقترحات لذلك...؟",
                      style: Styles.textStyle24,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "اكتب هنا .....",
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            CompliantCubit().postCompliant(
                                CacheHelper().getData(key: "email"), compliantController.text,
                                CacheHelper().getData(key: "name"));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          color: kPrimaryColor,
                          minWidth: 120.w,
                          height: 40.h,
                          child: const Text(
                            'ارسال',
                            style: Styles.textStyle20ColorWhite,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
