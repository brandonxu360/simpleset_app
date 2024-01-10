import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/exerciseset.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final Iterable<ExerciseSet>? exerciseSets;

  const ExerciseTile(
      {super.key, required this.exercise, required this.exerciseSets});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${exercise.order + 1}.   ${exercise.name}',
                  style: const TextStyle(fontSize: 18),
                ),
              ]),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Set#'), Text('Weight'), Text('Reps')],
          ),
          Column(children: [
            if (exerciseSets != null)
              for (var exerciseSet in exerciseSets!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${exerciseSet.order + 1}'),
                    Text('${exerciseSet.weight}'), // Display weight here
                    Text('${exerciseSet.reps}'), // Display reps here
                  ],
                ),
          ])
        ],
      ),
    ));
  }
}
