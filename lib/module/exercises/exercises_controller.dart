import 'package:flutter/cupertino.dart';
import 'package:iug_app/helper/DB.dart';

import '../../helper/assets_helper.dart';
import '../../model/TExercises.dart';
import '../../utils/utils.dart';
import '../../widget/circular_countdown_timer.dart';

class ExercisesController extends ChangeNotifier {
  ExercisesController() {
    getAllExercises();
  }

  bool isLoading = false;

  flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  List<TExercises>? listOFExercises;

  getAllExercises() async {
    flipIsLoading();
    listOFExercises = await DbHelper.dbHelper.getAllStudents();
    flipIsLoading();
  }

  CountDownController? countDownController = CountDownController();
  bool countIsStart = true;
  changecountIsStart(bool countValue) {
    countIsStart = countValue;
    notifyListeners();
  }

  nextExercises() {
    Utils.exerciseIndex++;
    notifyListeners();
  }

  preExercises() {
    --Utils.exerciseIndex;

    notifyListeners();
  }

  CountDownController? countDownController2 = CountDownController();

  int timeDuration = 20;

  addTimeDuration(int time) {
    timeDuration += time;
    print(timeDuration);
    notifyListeners();
  }
}
