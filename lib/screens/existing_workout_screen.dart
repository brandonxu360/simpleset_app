import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/exercise_tile.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/screens/create_exercise_screen.dart';

class ExistingWorkoutScreen extends StatefulWidget {
  final int index;

  const ExistingWorkoutScreen({super.key, required this.index});

  @override
  State<ExistingWorkoutScreen> createState() => _ExistingWorkoutScreenState();
}

class _ExistingWorkoutScreenState extends State<ExistingWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutListProvider>(
        builder: (context, workoutListProvier, child) => Scaffold(
              body: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 25, right: 25, bottom: 20),
                  child: Row(
                    children: [
                      MyBackButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              workoutListProvier.workoutList[widget.index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 24)),
                          Text(workoutListProvier
                              .workoutList[widget.index].date),
                        ],
                      ),
                    ],
                  ),
                ),
                if (workoutListProvier
                    .getWorkoutList()[widget.index]
                    .exercises
                    .isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                        'Why aren\'t there any exercises in this workout?'),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: workoutListProvier
                        .getWorkoutList()[widget.index]
                        .exercises
                        .length,
                    itemBuilder: (context, index) => ExerciseTile(
                      exercise: workoutListProvier
                          .getWorkoutList()[widget.index]
                          .exercises[index],
                      index: index,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
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
            ));
  }
}
