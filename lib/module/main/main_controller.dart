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
}
