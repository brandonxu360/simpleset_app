import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/exerciseset.dart';

class NewWorkoutProvider extends ChangeNotifier {
  String _newWorkoutName = '';
  String get newWorkoutName => _newWorkoutName;

  // Hold temporary Exercises and ExerciseSets associated with the new Workout
  final Map<Exercise, Set<ExerciseSet>> newExercisesAndSets = {};

  void setName(String name) {
    _newWorkoutName = name;

    notifyListeners();
  }

  void addExercise(Exercise exercise, Iterable<ExerciseSet> exerciseSets) {
    newExercisesAndSets[exercise] =
        {}; // Assign an empty list as a value for the exercise key

    for (ExerciseSet exerciseset in exerciseSets) {
      newExercisesAndSets[exercise]!.add(exerciseset);
    }
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
