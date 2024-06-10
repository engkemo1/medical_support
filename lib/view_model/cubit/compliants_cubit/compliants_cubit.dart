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
import '../../database/network/dio_helper.dart';
import 'compliants_state.dart';

class CompliantCubit extends Cubit<CompliantMainState> {
  CompliantCubit() : super(CompliantMainInitialState());

  static CompliantCubit get(context) => BlocProvider.of(context);

  ///////////////////////////////////get category//////////////////////////////////////////

  postCompliant( String email,String message,String name) async {
    emit(CompliantLoadingState());

    try {
      await DioHelper.postData(
          url: "${EndPoint.baseUrl}${EndPoint.complaints}",
          token: CacheHelper().getData(key: "token"),
          data: {
            "name": name,
            "email": email,
            "type": "complaint",
            "message": message,
          }).then((value) {
            SmartDialog.showToast("Complaint have been sent Successfully");
        print(value.data);
        emit(CompliantSuccessState());
      });
    } on DioError catch (e) {
      print(e.response);
      emit(CompliantErrorState(e));
    }
  }
}
