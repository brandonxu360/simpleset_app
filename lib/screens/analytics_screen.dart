import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/exercise_analytic_tile.dart';
import 'package:simpleset_app/data/exercise_map_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkoutListProvider, ExerciseMapProvider>(
      builder: (context, workoutListProvider, exerciseMapProvider, child) =>
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Exercises'),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: exerciseMapProvider.exerciseHistory.length,
                  itemBuilder: (context, index) => ExerciseAnalyticTile(
                      mapEntry: exerciseMapProvider.exerciseHistory.entries
                          .elementAt(index))),
            )
          ],
        ),
      ),
    );
  }
}
