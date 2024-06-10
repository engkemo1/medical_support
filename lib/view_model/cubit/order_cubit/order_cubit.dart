import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/api/end_point.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/model/category_model.dart';
import 'package:medical_support/model/order_admin_model.dart';
import 'package:medical_support/model/order_model.dart';
import 'package:medical_support/model/product_model.dart';
import '../../database/network/dio_helper.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderMainState> {
  OrderCubit() : super(OrderMainInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);
  List<CategoryModel> listCategoryModel = [];
  List<OrderAdminModel> listOrderAdminModel = [];

  OrderModel orderModel = OrderModel();
  List<OrderProducts> listOrderModel = [];

  addOrder(String address, var total, Map<int, ProductModel> products,BuildContext context) async {
    emit(OrderLoadingState());
print(CacheHelper().getData(key: "id"));
    try {
      await DioHelper.postData(
              data: {
            "user_id": CacheHelper().getData(key: "id"),
            "status": "pending",
            "address": address,
            "total": total,
            "products": products.entries
                .map((e) => {
                      "id": e.value.id,
                      "name": e.value.name,
                      "quantity": e.key,
                      "price": e.value.price
                    })
                .toList()
          },
              url: "${EndPoint.baseUrl}${EndPoint.orders}",
              token: CacheHelper().getData(key: "token"))
          .then((value) {
        SmartDialog.showToast("Added successfully");
        Navigator.pop(context);
        emit(OrderSuccessState());
      });
    } on DioError catch (e) {
      SmartDialog.showToast("something error");
      print(e.response);
      emit(OrderErrorState(e));
    }
  }

  getOrder() async {
    emit(OrderLoadingState());
print(CacheHelper().getData(key: "id"));
    try {
      await DioHelper.getData(
              url: "https://mydoctory.net/example-app/public/api/orders/${CacheHelper().getData(key: "id")}",
              token: CacheHelper().getData(key: "token"))
          .then((value) {
        listOrderModel = (value.data["order_products"] as List)
            .map((e) => OrderProducts.fromJson(e))
            .toList();
        orderModel=OrderModel.fromJson(value.data);
        print(orderModel);
        print(listOrderModel);

        emit(OrderSuccessState());
      });
    } on DioError catch (e) {
      SmartDialog.showToast("something error");
      print(e.response);
      emit(OrderErrorState(e));
    }
  }
  getAdminOrder() async {
    emit(GetOrderAdminLoadingState());
    print(CacheHelper().getData(key: "token"));
    try {
      await DioHelper.getData(
          url: "https://mydoctory.net/example-app/public/api/admin/orders",
          token: CacheHelper().getData(key: "token"))
          .then((value) {
        listOrderAdminModel = (value.data as List)
            .map((e) => OrderAdminModel.fromJson(e))
            .toList();

        emit(GetOrderAdminSuccessState());
      });
    } on DioError catch (e) {
      SmartDialog.showToast("something error");
      print(e.response);
      emit(GetOrderAdminErrorState(e));
    }
  }
}
