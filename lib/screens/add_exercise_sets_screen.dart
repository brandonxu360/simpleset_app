import 'package:flutter/material.dart';

class AddExerciseSetsScreen extends StatefulWidget {
  final String exerciseName;
  const AddExerciseSetsScreen({super.key, required this.exerciseName});

  @override
  State<AddExerciseSetsScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseSetsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        Row(
          children: [],
        )
      ]),
    );
  }
}
