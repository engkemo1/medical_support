import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/features/cart/presentation/views/checkout.dart';

import '../../../../../view_model/cubit/category_cubit/category_cubit.dart';
import '../../../../../view_model/cubit/category_cubit/category_state.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({
    super.key,
  });

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    context.read<CategoryCubit>().price = 0.0;
    var data = context.read<CategoryCubit>().cart.entries.toList();
    for (var e in data) {
      context.read<CategoryCubit>().price +=
          e.key * double.parse(e.value.price!);
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryMainState>(
      builder: (context, state) {
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
                Text(
                  "السعر الكلى :${context.read<CategoryCubit>().price} LE",
                  style: Styles.textStyle24ColorWhite,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color(0xff7C88F2),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CheckOut(
                                  total: context.read<CategoryCubit>().price,
                                  products: context.read<CategoryCubit>().cart,
                                )));
                  },
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
              const CustomAppBar(
                title: "السلة",
                isBack: true,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: context.read<CategoryCubit>().cart.length,
                  itemBuilder: (context, index) {
                    num number = 0;

                    var entry = context
                        .read<CategoryCubit>()
                        .cart
                        .entries
                        .toList()[index];
                    var productModel = entry.value; // Your model instance
                    var productId = entry.key; //
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
                                leading: Image.network(
                                  entry.value.image.toString(),
                                  errorBuilder: (context, r, o) {
                                    return Image.asset(
                                      Assets.logo,
                                      width: 100,
                                      height: 100,
                                    );
                                  },
                                  width: 100,
                                  height: 100,
                                ),
                                title: Text(
                                  entry.value.name.toString(),
                                  style: Styles.textStyle28,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    context.read<CategoryCubit>().price = 0.0;

                                    context
                                        .read<CategoryCubit>()
                                        .cart
                                        .remove(entry.key);
                                    setState(() {});

                                    var d = context
                                        .read<CategoryCubit>()
                                        .cart
                                        .entries
                                        .toList();
                                    print(d);
                                    context.read<CategoryCubit>().price = 0.0;

                                    for (var e in d) {
                                      print(e.key);
                                      context.read<CategoryCubit>().price +=
                                          e.key * double.parse(e.value.price!);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 38,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StatefulBuilder(
                                        builder: (context, setstate) {
                                      return Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              // if (number <= 0) {
                                              //   number = 0;
                                              // } else {
                                              //   number -= 1;
                                              // }
                                              // setstate(() {});
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back_ios_new_sharp,
                                            ),
                                          ),
                                          Text(
                                            (number + entry.key).toString(),
                                            style: Styles.textStyle24,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // context
                                              //         .read()<CategoryCubit>()
                                              //         .price +=
                                              //     double.parse(
                                              //         entry.value.price!);
                                              //
                                              // number += 1;
                                              // setstate(() {});
                                            },
                                            icon: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                    Text(
                                      "${entry.value.price.toString()} L.E",
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
      },
      listener: (BuildContext context, CategoryMainState state) {},
    );
  }
}
