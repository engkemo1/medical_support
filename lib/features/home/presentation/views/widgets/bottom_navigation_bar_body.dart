import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/utils/styles.dart';

class BottomNavigationBarBody extends StatefulWidget {
  const BottomNavigationBarBody({super.key});

  @override
  State<BottomNavigationBarBody> createState() =>
      _BottomNavigationBarBodyState();
}

class _BottomNavigationBarBodyState extends State<BottomNavigationBarBody> {
  num number = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 80.h,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 35.sp,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (number <= 0) {
                      number = 0;
                    } else {
                      number -= 1;
                    }
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text(
                  number.toString(),
                  style: Styles.textStyle35,
                ),
                IconButton(
                  onPressed: () {
                    number += 1;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
