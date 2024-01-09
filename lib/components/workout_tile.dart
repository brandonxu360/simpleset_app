import 'package:flutter/material.dart';
import 'package:simpleset_app/models/workout.dart';
import 'package:simpleset_app/util/helper_functions.dart';

class WorkoutTile extends StatelessWidget {
  final Workout workout;
  final Function()? onTap;

  const WorkoutTile({super.key, required this.workout, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 180,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              workout.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            subtitle: Text(
              formatDateTime(workout.dateTime),
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ),
      ),
    );
  }
}
