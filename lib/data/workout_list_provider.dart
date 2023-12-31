import 'package:flutter/material.dart';
import 'package:simpleset_app/models/workout.dart';
import 'package:simpleset_app/models/exercise.dart';

class WorkoutListProvider extends ChangeNotifier {
  /*

  WORKOUT DATA STRUCTURE

  - The user's completed workouts will be stored in a list
  - Each workout has a name and a list of exercises (refer to workout.dart/Workout class)

  */

  // List of all completed workouts
  List<Workout> workoutList = [
    Workout(name: 'Push', date: '12/26/23', exercises: []),
    Workout(name: 'Pull', date: '12/27/23', exercises: [])
  ];

  // List of exercise history
  List<Exercise> exerciseList = [
    Exercise(name: 'Pushup', sets: []),
    Exercise(name: 'Barbell Squat', sets: [])
  ];

  // METHODS
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  void addWorkout(Workout newWorkout) {
    workoutList.add(newWorkout);

    notifyListeners();
  }

  void deleteWorkout(int index) {
    workoutList.removeAt(index);

    notifyListeners();
  }

  void addExerciseSet(String workoutName, String exerciseName, int setNum,
      double weight, int reps) {}
}
