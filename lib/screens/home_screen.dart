import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_data_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkoutDataProvider, NewWorkoutProvider>(
        builder: (context, workoutListProvider, newWorkoutProvider, child) =>
            Text('Placeholder'));
  }
}
