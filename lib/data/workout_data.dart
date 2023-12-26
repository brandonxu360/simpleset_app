import 'package:flutter/material.dart';
import 'package:simpleset_app/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  /*

  WORKOUT DATA STRUCTURE

  - The user's completed workouts will be stored in a list
  - Each workout has a name and a list of exercises (refer to workout.dart/Workout class)

  */

  // List of all completed workouts
  List<Workout> workoutList = [
    Workout(name: 'Push', exercises: []),
    Workout(name: 'Pull', exercises: [])
  ];

  // METHODS
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  void addWorkout(String name) {
    workoutList.add(Workout(name: name, exercises: []));

    notifyListeners();
  }

  void addExerciseSet(String workoutName, String exerciseName, int setNum,
      double weight, int reps) {}
}
