import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_support/core/api/api_consumer.dart';
import 'package:medical_support/core/api/end_point.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/core/errors/exceptions.dart';
import 'package:medical_support/features/logIn/data/models/Log_in_model.dart';

import 'log_in_stata.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.api) : super(LogInitial());

  final ApiConsumer api;
  LogInModel? logInModel;

  //Sign in Form key
  GlobalKey<FormState> logInFormKey = GlobalKey();

  //Sign in email
  TextEditingController logInEmail = TextEditingController();

  //Sign in password
   TextEditingController logInPassword = TextEditingController();


  logIn() async {
    emit(LogInLoading());
    try {
      var response = await api.post(
        EndPoint.login,
        data: {
          ApiKeys.email: logInEmail.text,
          ApiKeys.password: logInPassword.text,
        }
      );
      emit(LogInSuccess());
      logInModel = LogInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKeys.token, value: logInModel!.token);
      CacheHelper().saveData(key: ApiKeys.userId, value:logInModel!.user!.id);
    } on ServerException catch (e) {
      emit(
        LogInFailed(errorMessage: e.errorModel.message!),
      );
    }
  }
}
