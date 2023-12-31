import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/workout.dart';
import 'package:simpleset_app/models/exercise_set.dart';

class NewWorkoutProvider extends ChangeNotifier {
  /*

  This class provides the state for the new workout that is postured to be added to the master
  workout list (see workout_list_provider.dart)

  */

  final Workout _newWorkout = Workout(name: '', date: '', exercises: []);

  Workout getNewWorkout() {
    return _newWorkout;
  }

  void setName(String name) {
    _newWorkout.name = name;
  }

  void setDate(String date) {
    _newWorkout.date = date;
  }

  void addExercise(String name, List<ExerciseSet> sets) {
    _newWorkout.exercises.add(Exercise(name: name, sets: sets));

    notifyListeners();
  }

  void clear() {
    _newWorkout.name = '';
    _newWorkout.date = '';
    _newWorkout.exercises.clear();
  }
}
