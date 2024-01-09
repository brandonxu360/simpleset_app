import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/exercise_tile.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/save_button.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_data_provider.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/workout.dart';
import 'package:simpleset_app/screens/create_exercise_screen.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBackButton(onTap: () {
                  // On exiting without saving, dispose of current NewWorkout
                  Provider.of<NewWorkoutProvider>(context, listen: false)
                      .reset();

                  Navigator.pop(context);
                }),
                // New workout name
                Text(Provider.of<NewWorkoutProvider>(context).newWorkoutName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 24)),

                SaveButton(onTap: () {
                  Provider.of<WorkoutDataProvider>(context, listen: false)
                      .addWorkout(
                          Workout(
                              name: Provider.of<NewWorkoutProvider>(context,
                                      listen: false)
                                  .newWorkoutName),
                          Map.from(Provider.of<NewWorkoutProvider>(context,
                                  listen: false)
                              .newExercisesAndSets));
                  Provider.of<NewWorkoutProvider>(context, listen: false)
                      .reset();
                  Navigator.pop(context);
                })
              ],
            ),
            Consumer<NewWorkoutProvider>(
                builder: (context, value, child) => value
                        .newExercisesAndSets.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: value.newExercisesAndSets.keys.length,
                            itemBuilder: (context, index) {
                              print(index.toString());
                              // Search for Exercise of correct order (searching for every exercise not efficient?)
                              final Exercise exercise =
                                  value.newExercisesAndSets.keys.firstWhere(
                                      (exercise) => exercise.order == index);
                              return ExerciseTile(
                                  exercise: exercise,
                                  exerciseSets:
                                      value.newExercisesAndSets[index]);
                            }),
                      )
                    : const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text('No exercises recorded yet!'),
                        ),
                      )),
            MyButton(
                label: 'Add exercise',
                icon: const Icon(Icons.add_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateExerciseScreen()));
                })
          ],
        ),
      ),
    );
  }
}
