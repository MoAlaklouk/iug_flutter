import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/circular_countdown_timer.dart';

class Helper {
  static timerHelper(
      {required controller,
      required int duration,
      TextStyle? textStyle,
      Function? onComplete}) {
    return CircularCountDownTimer(
      textStyle: textStyle,
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      height: 0.23.sh,
      width: 0.5.sw,
      duration: duration,
      fillColor: Colors.blue,
      ringColor: Colors.grey,
      controller: controller,
      strokeWidth: 10,
      onComplete: () => onComplete!(),
    );
  }

  static void naviagtTo(context, Widget widget) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget),
      );

  static void naviagtTofinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (route) {
          return false;
        },
      );
}
