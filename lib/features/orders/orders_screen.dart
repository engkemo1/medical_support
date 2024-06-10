import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/features/cart/presentation/views/checkout.dart';
import 'package:medical_support/view_model/cubit/order_cubit/order_cubit.dart';
import 'package:medical_support/view_model/cubit/order_cubit/order_state.dart';

import '../../../../../view_model/cubit/category_cubit/category_cubit.dart';
import '../../../../../view_model/cubit/category_cubit/category_state.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
    return BlocProvider<OrderCubit>(
      create: (BuildContext context) => OrderCubit()..getOrder(),
      child: BlocConsumer<OrderCubit, OrderMainState>(
        builder: (context, state) {
          var orderModel =OrderCubit.get(context).orderModel;
          var listOrderModel =OrderCubit.get(context).listOrderModel;

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
                    "السعر الكلى :${orderModel.total} LE",
                    style: Styles.textStyle24ColorWhite,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${orderModel.address} ",
                        style: Styles.textStyle24ColorWhite,
                      ),
                      const Text(
                        " : العنوان ",
                        style: Styles.textStyle24ColorWhite,
                      ),

                    ],
                  ),
                ],
              ),
            ),

            body: Column(
              children: [
                const CustomAppBar(
                  title: "الطلبات",
                  isBack: false,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listOrderModel.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Container(
                            padding: EdgeInsets.all(10),
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
                                  leading: Icon(Icons.shopping_bag,color: Colors.lightBlue,size: 40,),
                                  title: Text(
                                    listOrderModel[index].name.toString(),
                                    style: Styles.textStyle28,
                                  ),
                                  trailing:    Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
                                    child: Text(
                                      orderModel.status.toString(),
                                      style: Styles.textStyle18,
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
                                                                Text(
                                        "${   listOrderModel[index].price.toString()} L.E",
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
        listener: (BuildContext context, OrderMainState state) async {
          if (state is GetOrderLoadingState) {
            SmartDialog.showLoading();
            await Future.delayed(const Duration(seconds: 2));
            SmartDialog.dismiss();
          }
        },
      ),
    );
  }
}
