import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';

class CreateExercise extends StatefulWidget {
  const CreateExercise({super.key});

  @override
  State<CreateExercise> createState() => _SearchExerciseScreenState();
}

class _SearchExerciseScreenState extends State<CreateExercise> {
  List<String> searchResults = [];

  TextEditingController exerciseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NewWorkoutProvider>(builder: (context, value, child) {
      return Text('Placeholder');
    });
  }
}
