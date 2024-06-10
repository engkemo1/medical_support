import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/api/end_point.dart';
import 'package:medical_support/features/home/presentation/views/home_view.dart';
import 'package:medical_support/model/login_model.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../features/admin/home_admin_screen.dart';
import '../../database/network/dio_helper.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthMainState> {
  AuthCubit() : super(AuthMainInitialState());
  User loginModel = User();

  static AuthCubit get(context) => BlocProvider.of(context);

  //Sign in email
  TextEditingController emailController = TextEditingController();

  //Sign in password
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  //Sign in name
  TextEditingController nameController = TextEditingController();

  login(BuildContext context,
      String email,
      String password,) async {
    emit(LoginLoadingState());

    try {
      await DioHelper.postData(
        url: "https://mydoctory.net/example-app/public/api/login",
        data: {
          "email": email,
          'password': password,
        },
      ).then((value) {
        print(value.data);

        loginModel = User.fromJson(value.data['user']);
        CacheHelper().saveData(key: 'token', value: value.data["token"]);
        CacheHelper().saveData(key: 'name', value: loginModel.name);
        CacheHelper().saveData(key: 'id', value: loginModel.id);
        CacheHelper().saveData(key: 'role', value: loginModel.states);

        CacheHelper().saveData(key: 'email', value: loginModel.email);
        if(loginModel.states=="Admin"){
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeAdminScreen()));
        }else{
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeView()));
        }
        emit(LoginSuccessState());
      });
    } on DioError catch (e) {
      print(e.response);
      emit(LoginErrorState(e));
    }
  }


  register(BuildContext context,) async {
    emit(RegisterLoadingState());

    try {
      await DioHelper.postData(
        url: "https://mydoctory.net/example-app/public/api/register",
        data: {
          "name": nameController.text,
          "email": emailController.text,
          "states": "Pharmacy",
          "password": passController.text,
          "password_confirmation": confirmPassController.text
        },
      ).then((value) {
        print(value.data);

        loginModel = User.fromJson(value.data['user']);
        CacheHelper().saveData(key: 'token', value: value.data["token"]);
        CacheHelper().saveData(key: 'name', value: loginModel.name);
        CacheHelper().saveData(key: 'role', value: loginModel.states);

        CacheHelper().saveData(key: 'id', value: loginModel.id);

        CacheHelper().saveData(key: 'email', value: loginModel.email);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (_) => const MainScreen()));

        print("sucessss");
        emit(RegisterSuccessState());
      });
    } on DioError catch (e) {
      print(e.response!.data);
      emit(RegisterErrorState(e));
    }
  }
}
