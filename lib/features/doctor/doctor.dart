import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/view_model/cubit/doctor_cubit/doctor_cubit.dart';

import '../../constants.dart';
import '../../view_model/cubit/doctor_cubit/doctor_state.dart';

class Doctor extends StatelessWidget {
  const Doctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 130,
                width: double.infinity,
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(alignment: Alignment.bottomLeft,
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      },
                          icon: Icon(Icons.arrow_back, size: 30,
                            color: Colors.white,)),),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_information,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "     المنتجات الجديده   ",
                            style: Styles.textStyle30ColorWeigh,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: BlocProvider<DoctorCubit>(
                create: (context)=>DoctorCubit()..getItems(),
                child: BlocConsumer<DoctorCubit, DoctorMainState>(
                  builder: (context, cubit) {
                    var list = DoctorCubit
                        .get(context)
                        .productModelList;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                onTap: () {
                                  SmartDialog.show(builder: (context) {
                                    return Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.7,
                                      padding: EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20), color: Colors.white),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .end,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [

                                            Image.network(
                                              list[index].image.toString(),
                                              errorBuilder: (context, o, e) =>
                                                  Image.asset(
                                                    Assets.logo,
                                                    width: 100,
                                                    height: 200,
                                                  ),
                                              height: 200,
                                            ),

                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                Text(
                                                  list[index].name.toString(),
                                                  style: Styles.textStyle35
                                                      .copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              " المرض : ${ list[index].type}",
                                              style: Styles.textStyle20,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Divider(),

                                            Text(
                                              "الوصف : ${ list[index]
                                                  .description}",
                                              style: Styles.textStyle20,
                                              textAlign: TextAlign.end,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Divider(),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [

                                                Text(
                                                  "${ list[index]
                                                      .price} L.E ",
                                                  textDirection: TextDirection
                                                      .ltr,
                                                  style: Styles.textStyle28
                                                      .copyWith(
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    decorationColor: Colors
                                                        .red,
                                                    decorationThickness: 2,
                                                  ),
                                                ),
                                                Text(
                                                  "السعر ",
                                                  style: Styles.textStyle28
                                                      .copyWith(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 22
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                                contentPadding: const EdgeInsets.all(16.0),
                                leading: Image.network(
                                  list[index].image.toString(),
                                  errorBuilder: (context, o, e) =>
                                      Image.asset(
                                        Assets.logo,
                                        width: 100,
                                        height: 100,
                                      ),
                                  width: 100,
                                  height: 100,
                                ),
                                title: Text(
                                  list[index].name!,
                                  style: Styles.textStyle28,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  listener:
                      (BuildContext context, DoctorMainState state) async {
                    if (state is DoctorLoadingState) {
                      SmartDialog.showLoading();
                      await Future.delayed(const Duration(seconds: 2));
                      SmartDialog.dismiss();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
