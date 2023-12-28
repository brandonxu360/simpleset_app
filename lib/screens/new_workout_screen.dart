import 'package:flutter/material.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/exercise_tile.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/models/workout.dart';
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
  late Workout newWorkout;

  @override
  void initState() {
    super.initState();
    newWorkout = Workout(
      name: widget.workoutName,
      date: formatDateTime(widget.date),
      exercises: [], // Initialize with an empty list
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              )
            ],
          ),
        ),
        if (newWorkout.exercises.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text('Ahhh...a new, empty workout!'),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: newWorkout.exercises.length,
            itemBuilder: (context, index) => ExerciseTile(
              exerciseName: newWorkout.exercises[index].name,
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
    );
  }
}
