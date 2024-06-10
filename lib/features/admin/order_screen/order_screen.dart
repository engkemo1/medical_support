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

class OrderAdminScreen extends StatefulWidget {
  const OrderAdminScreen({
    super.key,
  });

  @override
  State<OrderAdminScreen> createState() => _OrderAdminScreenState();
}

class _OrderAdminScreenState extends State<OrderAdminScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>(
      create: (BuildContext context) => OrderCubit()..getAdminOrder(),
      child: BlocConsumer<OrderCubit, OrderMainState>(
        builder: (context, state) {
          var listOrderModel =OrderCubit.get(context).listOrderAdminModel;

          return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,onPressed: (){
    Navigator.pop(context);
  },),
  title: Text("الطلبات",style: TextStyle(color: Colors.white),),centerTitle: true,
  ),
            body: Column(
              children: [

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
                                    listOrderModel[index].user!.name.toString(),
                                    style: Styles.textStyle28,
                                  ),
                                  trailing:    Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
                                    child: Text(
                                      listOrderModel[index].status.toString(),
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
                                        "${   listOrderModel[index].total.toString()} L.E",
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
          if (state is GetOrderAdminLoadingState) {
            SmartDialog.showLoading();
            await Future.delayed(const Duration(seconds: 2));
            SmartDialog.dismiss();
          }
        },
      ),
    );
  }
}
