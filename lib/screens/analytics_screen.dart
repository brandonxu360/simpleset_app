import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/data/workout_data_provider.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutDataProvider>(
      builder: (context, workoutListProvider, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Exercises'),
            ),
            // TODO: Display exercise history (all exercises of unique name)
            Expanded(
                child: ListView.builder(
                    itemCount: 0, itemBuilder: (context, index) => Text('')))
          ],
        ),
      ),
    );
  }
}
