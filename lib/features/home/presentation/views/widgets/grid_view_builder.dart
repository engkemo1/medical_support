import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_card.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.0.sp),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return const CustomCard();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
        ),
      ),
    );
  }
}
