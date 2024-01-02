import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise_set.dart';

class ExerciseMapProvider extends ChangeNotifier {
  /*

  EXERCISE DATA STRUCTURE

  - The user's completed exercises and entire set history will be stored in a map (key: exercise name, value: list of exercise sets)
  - Each exercise will have a name and a list of exercise sets (all exercise sets over time)
  - The purpose of this data is to provide analytics per exercise

  */

  // Map of exercise history
  Map<String, List<ExerciseSet>> exerciseHistory = {
    'Pushup': [],
    'Barbell Squat': []
  };
}
