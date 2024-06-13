import 'package:ecommerceapp/Config/theme/light_theme.dart';
import 'package:ecommerceapp/core/utils/routes_manager.dart';
import 'package:ecommerceapp/presentation/layouts/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        routes: {RoutesManager.homeRouteName: (context) => const HomeScreen()},
        initialRoute: RoutesManager.homeRouteName,
        theme: LightTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
