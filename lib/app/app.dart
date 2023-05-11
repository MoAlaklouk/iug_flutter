import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/DB.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static late SharedPreferences sharedPreferences;
  static onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();

  }
}
