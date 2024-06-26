import 'package:flutter/material.dart';
import 'package:medical_support/features/cart/presentation/views/cart_view.dart';
import 'package:medical_support/features/cart/presentation/views/checkout.dart';
import 'package:medical_support/features/compalints/presentation/views/compalints_view.dart';
import 'package:medical_support/features/contactUs/presentation/views/contact_us_view.dart';
import 'package:medical_support/features/drawer/presentation/views/drawer_view.dart';
import 'package:medical_support/features/home/presentation/views/details_view.dart';
import 'package:medical_support/features/home/presentation/views/home_view.dart';
import 'package:medical_support/features/home/presentation/views/medicines_view.dart';
import 'package:medical_support/features/logIn/presentation/views/log_in_view.dart';
import 'package:medical_support/features/logIn/presentation/views/logo_view.dart';
import 'package:medical_support/features/newProduct/presentation/views/new_product_view.dart';
import 'package:medical_support/features/splash/presentation/view/splash_view.dart';
import '../../features/onBoarding/presentation/view/on_boarding_view.dart';

abstract class AppRouter {
  static const kSplash = '/';
  static const kOnBoarding = '/onBoarding';
  static const kLogoView = '/kLogoView';
  static const kLogInView = '/login';
  static const kHomeView = '/home';
  static const kCartView = '/cart';
  static const kCheckOutView = '/CheckOut';
  static const kDrawerView = '/drawer';
  static const kMedicinesView = '/Medicines';
  static const kDetailsView = '/Details';
  static const kContactUsView = '/ContactUs';
  static const kCompalintsView = '/Compalints';
  static const kNewProduct = '/newProduct';

  static Route<Object?> router(RouteSettings settings) {
    switch (settings.name) {
      case kSplash:
        return MaterialPageRoute(builder: (context) {
          return const SplashView(); //replace this Scaffold with a Splash Screen
        });
      case kOnBoarding:
        return MaterialPageRoute(builder: (context) {
          return const OnBoardingView(); //replace this Scaffold with a on boarding Screen
        });
      case kLogoView:
        return MaterialPageRoute(builder: (context) {
          return const LogoView(); //replace this Scaffold with a on boarding Screen
        });

      case kLogInView:
        return MaterialPageRoute(builder: (context) {
          return const LogInView(); //replace this Scaffold with a login Screen
        });

      case kHomeView:
        return MaterialPageRoute(builder: (context) {
          return const HomeView(); //replace this Scaffold with a Home Screen
        });

      case kCartView:
        return MaterialPageRoute(builder: (context) {
          return const CartView(); //replace this Scaffold with a Home Screen
        });

      case kDrawerView:
        return MaterialPageRoute(builder: (context) {
          return const DrawerView(); //replace this Scaffold with a Home Screen
        });

      // case kMedicinesView:
      //   return MaterialPageRoute(builder: (context) {
      //     return  MedicinesView(products: [],); //replace this Scaffold with a Home Screen
      //   });

      // case kDetailsView:
      //   return MaterialPageRoute(builder: (context) {
      //     return const DetailsView(); //replace this Scaffold with a Home Screen
      //   });

      // case kCheckOutView:
      //   return MaterialPageRoute(builder: (context) {
      //     return const CheckOut(); //replace this Scaffold with a Home Screen
      //   });

      case kContactUsView:
        return MaterialPageRoute(builder: (context) {
          return const ContactUsView(); //replace this Scaffold with a Home Screen
        });

      case kCompalintsView:
        return MaterialPageRoute(builder: (context) {
          return const CompalintsView(); //replace this Scaffold with a Home Screen
        });

      case kNewProduct:
        return MaterialPageRoute(builder: (context) {
          return const NewProductView(); //replace this Scaffold with a Home Screen
        });

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("AppStrings.notFound"),
            ),
          );
        });
    }
  }
}
