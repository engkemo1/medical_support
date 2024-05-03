import 'package:flutter/material.dart';
import 'package:medical_support/constants.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/styles.dart';

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
              onTap: () {},
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
