import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/exerciseset.dart';

class NewWorkoutProvider extends ChangeNotifier {
  String _newWorkoutName = '';
  String get newWorkoutName => _newWorkoutName;

  late DateTime _date;
  DateTime get date => _date;

  // Hold temporary Exercises and ExerciseSets associated with the new Workout
  final LinkedHashMap<Exercise, Set<ExerciseSet>> newExercisesAndSets =
      LinkedHashMap();

  void setName(String name) {
    _newWorkoutName = name;

    notifyListeners();
  }

  void setDate(DateTime date) {}

  void addExercise(Exercise exercise) {
    print('in function');
    // Assign an empty list as a value for the exercise key
    final newExercise = <Exercise, Set<ExerciseSet>>{exercise: {}};
    newExercisesAndSets.addEntries(newExercise.entries);

    notifyListeners();
  }

  void addExerciseSetToExercise(Exercise exercise, ExerciseSet exerciseSet) {
    final exerciseSets = newExercisesAndSets[
        exercise]; // Retrieve the list of exercise sets for the given exercise
    if (exerciseSets != null) {
      exerciseSets.add(exerciseSet); // Add the new exercise set to the list
      notifyListeners();
    } else {
      // Handle case where the exercise is not found in the map
    }
  }

  void reset() {
    // Reset _newWorkout to an empty name
    _newWorkoutName = '';

    // Clear all exercises and exercise sets associated with the workout
    newExercisesAndSets.clear();

    notifyListeners();
  }
}
