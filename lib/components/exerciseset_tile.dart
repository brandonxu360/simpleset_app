import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise_set.dart';
import 'package:simpleset_app/util/helper_functions.dart';

class ExerciseSetTile extends StatelessWidget {
  final ExerciseSet mySet;

  const ExerciseSetTile({super.key, required this.mySet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mySet.setNum.toString()),
          //const SizedBox(width: 50),
          Text(formatWeight(mySet.weight)),
          //const SizedBox(width: 50),
          Text(mySet.reps.toString())
        ],
      ),
    );
  }
}
