import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise_set.dart';

class ExerciseAnalyticTile extends StatelessWidget {
  // Name, total # sets, average reps, average weight
  final MapEntry<String, List<ExerciseSet>> mapEntry;

  const ExerciseAnalyticTile({super.key, required this.mapEntry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(mapEntry.key,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300))
        ]),
      ),
    );
  }
}
