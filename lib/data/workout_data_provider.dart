import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/exerciseset.dart';
import 'package:simpleset_app/models/workout.dart';

class WorkoutDataProvider extends ChangeNotifier {
  late Future<Isar?> db;

  List<Workout> _workouts = [];
  List<Workout> get workouts => _workouts;

  WorkoutDataProvider() {
    db = openDB();
    init();
  }

  Future<void> init() async {
    final isar = await db;
    isar!.txn(() async {
      final workoutCollection = isar.workouts;
      _workouts = await workoutCollection.where().findAll();
      notifyListeners();
    });
  }

  Future<Isar?> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([WorkoutSchema, ExerciseSchema, ExerciseSetSchema],
          directory: dir.path);
    }

    return Isar.getInstance();
  }

  void addWorkout(
      Workout workout, Map<Exercise, Set<ExerciseSet>> exercisesAndSets) async {
    final isar = await db;
    await isar!.writeTxn(() async {
      // Save the workout to the workout collection in the database
      await isar.workouts.put(workout);
      // Add the workout to the local workout list
      _workouts.add(workout);

      for (Exercise exercise in exercisesAndSets.keys) {
        // Save each exercise to the exercise collection in the database
        await isar.exercises.put(exercise);
        // Add each exercise as a link to the workout
        workout.exercises.add(exercise);

        for (ExerciseSet exerciseset in exercisesAndSets[exercise]!) {
          // Save each exerciseset to the exerciseset collection in the database
          await isar.exerciseSets.put(exerciseset);
          // Add each exerciseset as a link to the exercise
          exercise.exerciseSets.add(exerciseset);
        }
        // Save the newly linked exercisesets
        await exercise.exerciseSets.save();
      }

      // Save the newly linked exercises
      await workout.exercises.save();

      notifyListeners();
    });
  }

  Future<List<Exercise>> queryExerciseWithPrefix(String query) async {
    final isar = await db;

    return await isar!.exercises
        .where()
        .filter()
        .nameStartsWith(query)
        .findAll();
  }
}
