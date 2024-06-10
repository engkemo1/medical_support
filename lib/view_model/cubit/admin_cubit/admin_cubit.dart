import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/api/end_point.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/model/category_model.dart';
import 'package:medical_support/model/product_model.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_state.dart';
import '../../../model/complaints_model.dart';
import '../../database/network/dio_helper.dart';
import 'admin_state.dart';

class AdminCubit extends Cubit<AdminMainState> {
  AdminCubit() : super(AdminMainInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);
  List<ComplaintsModel> listComplaintsModel = [];

  ///////////////////////////////////get Chats//////////////////////////////////////////

  getChats() async {
    emit(GetChatsLoadingState());
    print(CacheHelper().getData(key: "token"));
    try {
      await DioHelper.getData(
              url: "https://mydoctory.net/example-app/public/api/complaints",
              token: CacheHelper().getData(key: "token"))
          .then((value) {
        print(value.data);

        listComplaintsModel = (value.data as List)
            .map((e) => ComplaintsModel.fromJson(e))
            .toList();

        print("sucessss");
        emit(GetChatsSuccessState());
      });
    } on DioError catch (e) {
      print(e.response);
      emit(GetChatsErrorState(e));
    }
  }

  addItem(
    String name,
    String categoryId,
    String imageFilePath,
    String price,
    String type,
      String description
  ) async {
    print(CacheHelper().getData(key: "token"));
    FormData formData = FormData.fromMap({
      "name": name,
      "category_id":categoryId,
      "description": description,
      "price": price,
      "type": type,
      "image": await MultipartFile.fromFile(imageFilePath, filename: "upload.jpg"),
    });
    try {
      await DioHelper.postData(
          url: "https://mydoctory.net/example-app/public/api/products",
          token: CacheHelper().getData(key: "token"),
          data:formData).then((value) {
            SmartDialog.showToast("Added Successfully");
        print(value.data);


        print("sucessss");
      });
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
