import 'package:flutter/material.dart';

import 'exercise.dart';

class Workout extends ChangeNotifier {
  String name;
  String date;
  List<Exercise> exercises;

  Workout({required this.name, required this.date, required this.exercises});

  // Copy constructor
  Workout.copy(Workout workout)
      : this(
            name: workout.name,
            date: workout.date,
            exercises: List<Exercise>.from(workout.exercises));

  void replaceWith(Workout newWorkout) {
    name = newWorkout.name;
    date = newWorkout.date;
    exercises = List<Exercise>.from(newWorkout.exercises);
  }
}
