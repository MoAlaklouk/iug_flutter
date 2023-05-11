import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/module/main/main_screen.dart';
import 'package:iug_app/module/register/login_screen.dart';

import 'app/app.dart';
import 'firebase_options.dart';
import 'helper/DB.dart';
import 'module/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Application.onInit();
  await DbHelper.dbHelper.initDatabase();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: Application.sharedPreferences.getBool('login') ?? false
            ? MainScreen()
            : LoginScreen(),
      ),
    );
  }
}
