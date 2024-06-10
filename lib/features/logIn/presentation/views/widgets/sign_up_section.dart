import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';
import '../../../../../constants.dart';
import '../../../../../view_model/cubit/authintication_cubit/auth_cubit.dart';
import '../../../../../view_model/cubit/authintication_cubit/auth_state.dart';
import '../../../../home/presentation/views/home_view.dart';
import 'drop_down_botton.dart';

class SignUpSection extends StatelessWidget {
  SignUpSection({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthMainState>(
          listener: (context, state) async {
        if (state is RegisterLoadingState) {
          SmartDialog.showLoading();
          await Future.delayed(const Duration(seconds: 2));
          SmartDialog.dismiss();
        } else if (state is RegisterErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Failed"),
            ),
          );
        } else if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful"),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextField(
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please confirm your name';
    }},
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                  ),
                  labelText: 'الاسم',
                  controller: context.read<AuthCubit>().nameController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please confirm your email';
    }},
                  labelText: 'البريد الالكترونى',
                  controller: context.read<AuthCubit>().emailController,
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
                  controller: context.read<AuthCubit>().passController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value !=
                        context.read<AuthCubit>().passController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(
                    Icons.key_outlined,
                  ),
                  labelText: 'تأكيد كلمة السر ',
                  controller: context.read<AuthCubit>().confirmPassController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const DropDownButton(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthCubit.get(context).register(
                        context,
                      );                    }

                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kPrimaryColor)),
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
