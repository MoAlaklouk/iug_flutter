// import 'dart:typed_data';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:sport_app/helper/assets_helper.dart';
// import 'package:sport_app/helper/helper.dart';
// import 'package:sport_app/helper/sound_helper.dart';
// import 'package:sport_app/l10n/l10n.dart';
// import 'package:sport_app/model/TExercises.dart';
// import 'package:sport_app/utils/utils.dart';

// import '../../widget/circular_countdown_timer.dart';

// class ExercisesController extends GetxController {
//   List<TExercises> listOFExercises = [
//     TExercises(AssetsHelper.man, '${L10n.getString().exercise} 1', true,
//         timer: 15),
//     TExercises(AssetsHelper.man, '${L10n.getString().exercise} 2', false,
//         steps: 13),
//     TExercises(AssetsHelper.man, '${L10n.getString().exercise} 3', false,
//         steps: 12),
//     TExercises(AssetsHelper.man, '${L10n.getString().exercise} 4', true,
//         timer: 30),
//     TExercises(AssetsHelper.man, '${L10n.getString().exercise} 5', false,
//         steps: 8),
//   ];
//   CountDownController? countDownController = CountDownController();
//   bool countIsStart = true;
//   changecountIsStart(bool countValue) {
//     countIsStart = countValue;
//     update();
//   }

//   nextExercises() {
//     Utils.exerciseIndex++;
//     update();
//   }

//   preExercises() {
//     --Utils.exerciseIndex;

//     update();
//   }

//   CountDownController? countDownController2 = CountDownController();

//   int timeDuration = 20;

//   addTimeDuration(int time) {
//     timeDuration += time;
//     print(timeDuration);
//     update();
//   }

//   @override
//   void onInit() async {
//     super.onInit();
//   }
// }
