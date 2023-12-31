import 'package:flutter/material.dart';

import 'exercise.dart';

class Workout extends ChangeNotifier {
  String name;
  String date;
  final List<Exercise> exercises;

  Workout({required this.name, required this.date, required this.exercises});
}
