import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/data/workout_data.dart';
import 'package:simpleset_app/screens/app_wrapper.dart';
import 'package:simpleset_app/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: darkMode,
          darkTheme: darkMode,
          home: const AppWrapper()),
    );
  }
}
