import 'package:flutter/material.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/models/exerciseset.dart';

class AddExerciseSetsScreen extends StatefulWidget {
  final String exerciseName;

  const AddExerciseSetsScreen({super.key, required this.exerciseName});

  @override
  State<AddExerciseSetsScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseSetsScreen> {
  TextEditingController weightTextController = TextEditingController();
  TextEditingController repTextController = TextEditingController();

  List<ExerciseSet> newSetList = [];

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewWorkoutProvider>(
      builder: (context, value, child) => Text('Placeholder'),
    );
  }
}
