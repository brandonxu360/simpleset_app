import 'package:flutter/material.dart';

class ExerciseTile extends StatefulWidget {
  final String exerciseName;

  const ExerciseTile({super.key, required this.exerciseName});

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              widget.exerciseName,
              style: const TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}
