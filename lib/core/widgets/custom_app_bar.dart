import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.isBack = false});

  final String title;

  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        color: Colors.white,
        iconSize: 30.sp,
        onPressed: () {
          Navigator.of(context).push(
            AppRouter.router(
              const RouteSettings(name: AppRouter.kDrawerView),
            ),
          );
        },
        icon: const Icon(
          Icons.menu,
        ),
      ),
      title: Text(
        title,
        style: Styles.textStyle30ColorWeigh,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            color: Colors.white,
            iconSize: 30.sp,
            onPressed: isBack
                ? () {
                    Navigator.of(context).pop();
                  }
                : () {
                    Navigator.of(context).push(
                      AppRouter.router(
                        const RouteSettings(name: AppRouter.kCartView),
                      ),
                    );
                  },
            icon:  Icon(
                isBack?Icons.arrow_forward_ios:
                Icons.shopping_cart),
          ),
        )
      ],
    );
  }
}
