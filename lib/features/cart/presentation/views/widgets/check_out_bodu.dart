import 'package:flutter/material.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';

import '../../../../../constants.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: "تاكيد الشراء",
            isBack: true,
          ),
          Padding(
            padding:  const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "طريقة التوصيل ",
                        style:
                            Styles.textStyle28.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        height: 70,
                        minWidth: double.infinity,
                        color: const Color(0xffAC7EBC),
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "توصيل الى  مكانك الحالى",
                          style: Styles.textStyle20ColorWhite,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "شحن الى :  ",
                        style:
                            Styles.textStyle28.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffAC7EBC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "اضافة  عنوان",
                          hintStyle: Styles.textStyle20ColorWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اختيار طريقة الدفع ......",
                        style:
                            Styles.textStyle28.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        height: 70,
                        minWidth: double.infinity,
                        color: const Color(0xffAC7EBC),
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RadioListTile(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: "dds",
                          title: const Text(
                            "عن طريقة البطاقة ",
                            style: Styles.textStyle20ColorWhite,
                          ),
                          onChanged: (value) {},
                          groupValue: '',
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        height: 70,
                        minWidth: double.infinity,
                        color: kPrimaryColor,
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RadioListTile(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: "dds",
                          title: const Text(
                            "عند التسليم",
                            style: Styles.textStyle20ColorWhite,
                          ),
                          onChanged: (value) {},
                          groupValue: '',
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
