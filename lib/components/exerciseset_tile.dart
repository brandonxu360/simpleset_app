import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise_set.dart';
import 'package:simpleset_app/util/helper_functions.dart';

class ExerciseSetTile extends StatelessWidget {
  final int setListLength;
  final int myIndex;
  final ExerciseSet mySet;
  final bool roundTop; // Don't want to round the top in exerciseset_tile.dart

  const ExerciseSetTile(
      {super.key,
      required this.setListLength,
      required this.myIndex,
      required this.mySet,
      required this.roundTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: myIndex == 0 && !roundTop
            ? BorderRadius.circular(0)
            : setListLength == 1
                ? BorderRadius.circular(12)
                : myIndex == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))
                    : myIndex == setListLength - 1
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))
                        : BorderRadius.circular(0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
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
      ),
    );
  }
}
