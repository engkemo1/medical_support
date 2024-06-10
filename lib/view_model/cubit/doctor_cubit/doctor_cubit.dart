import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_support/core/api/end_point.dart';
import 'package:medical_support/model/product_model.dart';
import '../../database/network/dio_helper.dart';
import 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorMainState> {
  DoctorCubit() : super(DoctorMainInitialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  List<ProductModel> productModelList = [];


  ///////////////////////////////////get items//////////////////////////////////////////

  getItems() async {
    emit(DoctorLoadingState());

    try {
      await DioHelper.getData(
          url: "${EndPoint.baseUrl}${EndPoint.doctor}",
          // token: CacheHelper().getData(key: "token")

      )
          .then((value) {
        print(value.data);

        productModelList =
            (value.data as List).map((e) => ProductModel.fromJson(e)).toList();

        print("sucessss");
        emit(DoctorSuccessState());
      });
    } on DioError catch (e) {
      print(e.response);
      emit(DoctorErrorState(e));
    }
  }

}
