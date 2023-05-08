import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'module/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: Application.navigatorKey,
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: L10n.localizationsDelegates,
        home: RegisterScreen(),
      ),
    );
  }
}
