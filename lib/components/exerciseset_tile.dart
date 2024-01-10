import 'package:flutter/material.dart';
import 'package:simpleset_app/util/helper_functions.dart';

class ExerciseSetTile extends StatelessWidget {
  final int setNum;
  final double weight;
  final int reps;

  const ExerciseSetTile(
      {super.key,
      required this.setNum,
      required this.weight,
      required this.reps});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(setNum.toString()),
        Text(formatWeight(weight).toString()),
        Text(reps.toString())
      ],
    );
  }
}
