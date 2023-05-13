import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  List<String> image = [
    'https://cdn.muscleandstrength.com/sites/default/files/chest_feature.jpg',
    'https://www.bodybuilding.com/images/2016/june/leg-workouts-for-men-7-best-workouts-for-quads-glutes-hams-header-v2-830x467.jpg',
    'https://cdn.muscleandstrength.com/sites/default/files/best_back_exercises_-_1200x630.jpg'
  ];
  List<String> text = [
    'chest',
    'leg',
    'backmuscles',
  ];

  List<String> tAddExercises = ['name', 'image', 'timer', 'steps'];
  bool isTimer = false;
  changeValueIsTimer(bool value) {
    isTimer = value;
    notifyListeners();
  }

  TextEditingController nameEx = TextEditingController();
  TextEditingController imageEx = TextEditingController();
  TextEditingController timerEx = TextEditingController();
  TextEditingController stepsEx = TextEditingController();

  PlatformFile? file;
  File? imagePath;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
      ],
    );

    if (result != null) {
      imagePath = File(result.files.single.path!);
      imageEx.text = result.files.single.path!;
      file = result.files.single;
      notifyListeners();
      print('file path:${imagePath!.path}');
    } else {
      notifyListeners();
    }

    notifyListeners();
  }
}
