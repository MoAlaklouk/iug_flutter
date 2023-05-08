import 'package:flutter/material.dart';

class DialogHelper {
  static showDialog(
          {String title = 'Confirm',
          String description = '',
          Color backgroundColor = Colors.white,
          TextStyle? titleStyle,
          TextStyle? descriptionStyle,
          Widget? confirm,
          Widget? cancle}) =>
      showDialog(
        title: title,
        description: description,
        backgroundColor: backgroundColor,
        titleStyle: titleStyle,
        descriptionStyle: descriptionStyle,
        confirm: confirm,
        cancle: cancle,
      );
}
