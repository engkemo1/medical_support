import 'package:flutter/material.dart';
import 'package:medical_support/features/cart/presentation/views/cart_view.dart';
import 'package:medical_support/features/drawer/presentation/views/drawer_view.dart';
import 'package:medical_support/features/home/presentation/views/details_view.dart';
import 'package:medical_support/features/home/presentation/views/home_view.dart';
import 'package:medical_support/features/home/presentation/views/medicines_view.dart';
import 'package:medical_support/features/logIn/presentation/views/log_in_view.dart';
import 'package:medical_support/features/logIn/presentation/views/logo_view.dart';
import 'package:medical_support/features/onBoarding/presentation/view/on_boarding_view.dart';
import 'package:medical_support/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kSplash = '/';
  static const kOnBoarding = '/onBoarding';
  static const kLogoView = '/kLogoView';
  static const kLogInView = '/login';
  static const kHomeView = '/home';
  static const kCartView = '/cart';
  static const kDrawerView = '/drawer';
  static const kMedicinesView = '/Medicines';
  static const kDetailsView = '/Details';

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

      case kMedicinesView:
        return MaterialPageRoute(builder: (context) {
          return const MedicinesView(); //replace this Scaffold with a Home Screen
        });

      case kDetailsView:
        return MaterialPageRoute(builder: (context) {
          return const DetailsView(); //replace this Scaffold with a Home Screen
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
