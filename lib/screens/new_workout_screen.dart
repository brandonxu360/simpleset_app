import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/exercise_tile.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/save_button.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/screens/create_exercise_screen.dart';
import 'package:simpleset_app/util/helper_functions.dart';

class NewWorkoutScreen extends StatefulWidget {
  final String workoutName;
  final DateTime date;

  const NewWorkoutScreen(
      {super.key, required this.workoutName, required this.date});

  @override
  State<NewWorkoutScreen> createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkoutListProvider, NewWorkoutProvider>(
      builder: (context, workoutListProvider, newWorkoutProvider, child) =>
          Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: Row(
              children: [
                const MyBackButton(),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.workoutName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24)),
                    Text(formatDateTime(widget.date)),
                  ],
                ),
                const Spacer(),
                SaveButton(
                  onTap: () {
                    workoutListProvider
                        .addWorkout(newWorkoutProvider.getNewWorkout());
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          if (newWorkoutProvider.getNewWorkout().exercises.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text('Ahhh...a new, empty workout!'),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: newWorkoutProvider.getNewWorkout().exercises.length,
              itemBuilder: (context, index) => ExerciseTile(
                exerciseName:
                    newWorkoutProvider.getNewWorkout().exercises[index].name,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: MyButton(
              label: 'Add Exercise',
              icon: const Icon(Icons.add_rounded),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateExercise())),
            ),
          )
        ]),
      ),
    );
  }
}
