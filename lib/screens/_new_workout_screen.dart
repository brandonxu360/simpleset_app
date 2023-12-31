import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/exercise_tile.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/save_button.dart';
import 'package:simpleset_app/models/workout.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/screens/create_exercise_screen.dart';

class NewWorkoutScreen extends StatefulWidget {
  final String workoutName;
  final String date;

  const NewWorkoutScreen({
    super.key,
    required this.workoutName,
    required this.date,
  });

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
            padding:
                const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 20),
            child: Row(
              children: [
                MyBackButton(
                  onTap: () {
                    newWorkoutProvider.clear();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.workoutName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24)),
                    Text(widget.date),
                  ],
                ),
                const Spacer(),
                SaveButton(
                  onTap: () {
                    workoutListProvider.addWorkout(
                        Workout.copy(newWorkoutProvider.getNewWorkout()));
                    newWorkoutProvider.clear();
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
                exercise: newWorkoutProvider.getNewWorkout().exercises[index],
                index: index,
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
