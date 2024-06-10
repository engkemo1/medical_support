import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/features/orders/orders_screen.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_cubit.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../logIn/presentation/views/logo_view.dart';

class DrawerViewBody extends StatelessWidget {
  const DrawerViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        width: double.infinity,
        backgroundColor: kPrimaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      endIndent: 320,
                      thickness: 4,
                    )
                  ],
                )),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  AppRouter.router(
                    const RouteSettings(
                      name: AppRouter.kHomeView,
                    ),
                  ),
                );
              },
              leading: const Icon(
                size: 33,
                Icons.dashboard_customize_outlined,
                color: Colors.white,
              ),
              title: const Text("الاقسام", style: Styles.textStyle24ColorWhite),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  AppRouter.router(
                    const RouteSettings(
                      name: AppRouter.kNewProduct,
                    ),
                  ),
                );
              },
              leading: const Icon(
                size: 33,
                Icons.add_box_outlined,
                color: Colors.white,
              ),
              title: const Text("المنتجات الجديدة",
                  style: Styles.textStyle24ColorWhite),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const OrderScreen()));
              },
              leading: const Icon(
                size: 33,
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              title: const Text("الطلبات ",
                  style: Styles.textStyle24ColorWhite),
            ),
Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  AppRouter.router(
                    const RouteSettings(
                      name: AppRouter.kCompalintsView,
                    ),
                  ),
                );
              },
              leading: const Icon(
                size: 33,
                Icons.chat_outlined,
                color: Colors.white,
              ),
              title: const Text("شكاوى ومقترحات",
                  style: Styles.textStyle24ColorWhite),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  AppRouter.router(
                    const RouteSettings(
                      name: AppRouter.kContactUsView,
                    ),
                  ),
                );
              },
              leading: const Icon(
                size: 33,
                Icons.contact_phone_outlined,
                color: Colors.white,
              ),
              title: const Text("تواصل معنا ",
                  style: Styles.textStyle24ColorWhite),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog(
                          title: const Text(
                            "هل انت متاكد من الخروج؟",
                            style: Styles.textStyle28,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "لا",
                                style: Styles.textStyle20,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            MaterialButton(
                              onPressed: () {
                                context.read<CategoryCubit>().cart.clear();
                                CacheHelper().clearData(key: 'token');
                                CacheHelper().clearData(key: 'name');
                                CacheHelper().clearData(key: 'name');
                                CacheHelper().clearData(key: 'role');

                                CacheHelper().clearData(key: 'email');
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LogoView()));
                              },
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "نعم",
                                style: Styles.textStyle20,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              leading: const Icon(
                size: 33,
                Icons.output,
                color: Colors.white,
              ),
              title: const Text("تسجيل الخروج",
                  style: Styles.textStyle24ColorWhite),
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
