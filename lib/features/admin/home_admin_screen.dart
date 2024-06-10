import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_support/features/admin/chats/chat_screen.dart';
import 'package:medical_support/features/admin/order_screen/order_screen.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_cubit.dart';

import '../../core/database/cache/cache_helper.dart';
import '../logIn/presentation/views/logo_view.dart';
import 'add_item.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.network(
              "https://img.freepik.com/premium-photo/medicine-motion-pills-scatter-against-pure-white-backdrop-vertical-mobile-wallpaper_896558-10478.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.black54,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "    مدير التطبيق  ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2 - 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ChatScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: 30,
                          ),
                          Text(
                            "الرسائل",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      CategoryCubit().getCategory().then((onValue){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddItemScreen(
                                  categoryModel: onValue,
                                )));
                      });

                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                            size: 30,
                          ),
                          Text(
                            "اضافة منتج جديد",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => OrderAdminScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 30,
                          ),
                          Text(
                            "الطلبات",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      CacheHelper().clearData(key: 'token');
                      CacheHelper().clearData(key: 'name');
                      CacheHelper().clearData(key: 'name');
                      CacheHelper().clearData(key: 'role');
                      CacheHelper().clearData(key: 'email');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LogoView()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red.withOpacity(0.8)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                          ),
                          Text(
                            "تسجيل خروج",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
