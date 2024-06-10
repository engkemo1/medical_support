import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:medical_support/view_model/database/network/dio_helper.dart';
import 'core/database/cache/cache_helper.dart';
import 'features/splash/presentation/view/splash_view.dart';

main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper().init();
  runApp(
  const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(
          create: (BuildContext context) => CategoryCubit()..getCategory()..getSubCategory(),

      ),

      // Add more BlocProviders if you have more blocs
      ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:const SplashView(),
        navigatorObservers: [FlutterSmartDialog.observer],
        // here
        builder: FlutterSmartDialog.init(),
      ),
      ),
    );
  }
}
