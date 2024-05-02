import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: "تواصل معنا ",
            isBack: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "اذا اردت التواصل معنا من خلال ...:",
                  style: Styles.textStyle24,
                ),
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      size: 25,
                      Icons.phone,
                    ),
                    title:
                        const Text("201101234567+", style: Styles.textStyle20),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      size: 25,
                      Icons.email,
                    ),
                    title: const Text("medisup@gamil.com",
                        style: Styles.textStyle20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
