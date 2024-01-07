import 'package:flutter/material.dart';
import 'package:simpleset_app/data/workout_data_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutDataProvider>(
        builder: (context, value, child) => Text('Placeholder'));
  }
}
