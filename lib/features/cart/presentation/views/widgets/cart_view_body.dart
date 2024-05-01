import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({
    super.key,
  });

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  num number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 120.h,
        decoration: const BoxDecoration(
          color: Color(0xffAC8EB1),
          border: Border(
            top: BorderSide(color: kPrimaryColor, width: 1),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "السعر الكلى :459.00 LE",
              style: Styles.textStyle24,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xff7C88F2),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "تاكيد الشراء",
                  style: Styles.textStyle20ColorWhite,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CustomAppBar(
            title: "السلة",
            isBack: true,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset(
                              Assets.enzymaxTest,
                              width: 100,
                              height: 100,
                            ),
                            title: const Text(
                              "Enzymax",
                              style: Styles.textStyle28,
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                                size: 38,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                      ),
                                    ),
                                    Text(
                                      number.toString(),
                                      style: Styles.textStyle24,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        number += 1;
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  "60.00 L.E",
                                  style: Styles.textStyle18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
