import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/features/logIn/presentation/views/widgets/log_in_section.dart';
import 'package:medical_support/features/logIn/presentation/views/widgets/sign_up_section.dart';


class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _SignUpState();
}

class _SignUpState extends State<LogInViewBody>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  late TabController tabController;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: double.infinity,
                    height: 700.h,
                    child: Stack(
                      children: [
                        Container(
                          color: kPrimaryColor,
                          width: double.infinity,
                          height: 335.h,
                        ),
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "مرحبا",
                                style: Styles.textStyle35,
                              ),
                              Text(
                                "من فضلك قم بتسجيل الدخول او قم بانشاء حساب جديد",
                                style: Styles.textStyle20ColorWhite,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 220.0.h,
                            right: 8.w,
                            left: 8.w,
                          ),
                          child: SizedBox(
                            height: 550,
                            child: Card(
                              shadowColor: Colors.black,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  TabBar(
                                    controller: tabController,
                                    tabs: const [
                                      Tab(
                                        text: 'تسجيل الدخول',
                                      ),
                                      Tab(
                                        text: 'حساب جديد',
                                      ),
                                    ],
                                    labelStyle: Styles.textStyle24,
                                    labelColor: Colors.black,
                                    indicatorColor: kPrimaryColor,
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: tabController,
                                      children:  [
                                        const  LogInSection(),
                                        SignUpSection(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 530.0.h),
                        //   child: Center(
                        //     child: FloatingActionButton(
                        //       backgroundColor: Colors.white,
                        //       shape: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(50.0.sp),
                        //         borderSide: const BorderSide(
                        //           width: 0,
                        //           color: Colors.transparent,
                        //         ),
                        //       ),
                        //       onPressed: () {
                        //         // context.read<AuthCubit>().login(context);
                        //       },
                        //       child: const Icon(
                        //         Icons.arrow_back,
                        //         color: kPrimaryColor,
                        //         size: 35,
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );



  }
}
