import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';
import 'package:medical_support/features/home/presentation/views/home_view.dart';
import 'package:medical_support/features/logIn/presentation/manager/cubits/logInCubit/log_in_cubit.dart';
import 'package:medical_support/view_model/cubit/authintication_cubit/auth_cubit.dart';
import 'package:medical_support/view_model/cubit/authintication_cubit/auth_state.dart';

import '../../../../../constants.dart';

class LogInSection extends StatefulWidget {
  const LogInSection({super.key});

  @override
  State<LogInSection> createState() => _LogInSectionState();
}

class _LogInSectionState extends State<LogInSection> {
  bool check = false;
  GlobalKey<FormState> logInFormKey = GlobalKey();

  //Sign in email
  TextEditingController emailController = TextEditingController();

  //Sign in password
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthMainState>(
        listener: (context, state) async{
          if (state is LoginLoadingState) {
            SmartDialog.showLoading();
            await Future.delayed(const Duration(seconds: 2));
            SmartDialog.dismiss();

          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Failed"),
              ),
            );
          }else if(state is LoginSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Successful"),
              ),
            );

          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: logInFormKey,
              child: ListView(
                children: [
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your email';
                      }},
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    labelText: 'البريد الالكترونى',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }},
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(
                      Icons.key_outlined,
                    ),
                    labelText: 'كلمة السر ',
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'هل نسيت كلمة المرور ؟',
                            style: Styles.textStyle16,
                          )),
                      Row(
                        children: [
                          Checkbox(
                            value: check,
                            onChanged: (bool? value) {
                              check == true ? check = false : check = true;
                              setState(() {});
                            },
                          ),
                          const Text(
                            "تذكرنى",
                            style: Styles.textStyle16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      if (logInFormKey.currentState!.validate()) {
                        AuthCubit.get(context).login(context, emailController.text, passwordController.text);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(kPrimaryColor)),
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
