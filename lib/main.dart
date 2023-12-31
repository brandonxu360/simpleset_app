import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/data/exercise_map_provider.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/screens/app_wrapper.dart';
import 'package:simpleset_app/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkoutListProvider>(
            create: (context) => WorkoutListProvider()),
        ChangeNotifierProvider<NewWorkoutProvider>(
            create: (context) => NewWorkoutProvider()),
        ChangeNotifierProvider<ExerciseMapProvider>(
            create: (context) => ExerciseMapProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          home: const AppWrapper()),
    );
  }
}
