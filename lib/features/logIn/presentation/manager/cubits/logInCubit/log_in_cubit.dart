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
  // SignUpModel? signUpModel;
  // UserModel ? userModel;

  //Sign in Form key
  GlobalKey<FormState> logInFormKey = GlobalKey();

  //Sign in email
  TextEditingController logInEmail = TextEditingController();

  //Sign in password
   TextEditingController logInPassword = TextEditingController();

  // //Sign Up Form key
  // GlobalKey<FormState> signUpFormKey = GlobalKey();
  //
  // //Profile Pic
  //  XFile? profilePic;
  //
  // //Sign up name
  // TextEditingController signUpName = TextEditingController();
  //
  // //Sign up phone number
  // TextEditingController signUpPhoneNumber = TextEditingController();
  //
  // //Sign up email
  // TextEditingController signUpEmail = TextEditingController();
  //
  // //Sign up password
  // TextEditingController signUpPassword = TextEditingController();
  //
  // //Sign up confirm password
  // TextEditingController confirmPassword = TextEditingController();

  // uploadImagePic(XFile image) {
  //   profilePic = image;
  //   emit(UploadImageSuccess());
  // }

  // getUserData() async {
  //   emit(UserLoading());
  //   try {
  //     var response = await api.get(
  //       EndPoint.getUserDataEndPoint(
  //         CacheHelper().getData(key: ApiKeys.userId),
  //       ),
  //     );
  //     userModel = UserModel.fromJson(response);
  //     emit(UserSuccess(
  //       userModel!,
  //     ));
  //   } on ServerException catch (e) {
  //     emit(
  //       UserFailed(errorMessage: e.errorModel.errorMessage),
  //     );
  //   }
  // }

  // signUp() async {
  //   emit(SingUpLoading());
  //   try {
  //     var response = await api.post(
  //       EndPoint.signUp,
  //       isFormData: true,
  //       body: {
  //         ApiKeys.name: signUpName.text,
  //         ApiKeys.email: signUpEmail.text,
  //         ApiKeys.password: signUpPassword.text,
  //         ApiKeys.confirmPassword: confirmPassword.text,
  //         ApiKeys.phone: signUpPhoneNumber.text,
  //         ApiKeys.location:
  //         '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
  //         ApiKeys.profilePic: await MultipartFile.fromFile(
  //           profilePic!.path,
  //           filename: profilePic!.name,
  //         ),
  //       },
  //     );
  //     signUpModel = SignUpModel.fromJson(response);
  //     emit(SingUpSuccess(
  //       signUpModel!.message!,
  //     ));
  //   } on ServerException catch (e) {
  //     emit(
  //       SingUpFailed(errorMessage: e.errorModel.errorMessage),
  //     );
  //   }
  // }

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
