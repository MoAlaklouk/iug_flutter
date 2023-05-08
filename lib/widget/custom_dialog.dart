import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static showDialog(
          {String title = 'Confirm',
          String description = '',
          Color backgroundColor = Colors.white,
          TextStyle? titleStyle,
          TextStyle? descriptionStyle,
          Widget? confirm,
          Widget? cancle}) =>
      Get.defaultDialog(
        title: title,
        middleText: description,
        backgroundColor: backgroundColor,
        titleStyle: titleStyle,
        middleTextStyle: descriptionStyle,
        confirm: confirm,
        cancel: cancle,
      );
}
