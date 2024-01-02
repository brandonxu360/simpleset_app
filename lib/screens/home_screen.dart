import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/go_button.dart';
import 'package:simpleset_app/components/my_textfield.dart';
import 'package:simpleset_app/components/workout_tile.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/models/workout.dart';
import 'package:simpleset_app/screens/workout_screen.dart';
import 'package:simpleset_app/util/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkoutListProvider, NewWorkoutProvider>(
        builder: (context, workoutListProvider, newWorkoutProvider, child) =>
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25, left: 25, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Start a new workout',
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 50, right: 25, left: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          hintText: 'Name a new workout!',
                          obscureText: false,
                          controller: workoutNameController,
                          showIcon: false,
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GoButton(onTap: () {
                        if (workoutNameController.text != '') {
                          String workoutName = workoutNameController.text;
                          String date = formatDateTime(DateTime.now());

                          newWorkoutProvider.setName(workoutName);
                          newWorkoutProvider.setDate(date);

                          workoutNameController.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings:
                                    const RouteSettings(name: 'WorkoutScreen'),
                                builder: (context) => WorkoutScreen(
                                  workout: Workout(
                                    name: workoutName,
                                    date: date,
                                    exercises: [],
                                  ),
                                  index: null,
                                ),
                              ));
                        } else {
                          // TODO: REQUIRE NONEMPTY NAME
                        }
                        // Unfocus textfield upon returning to Homepage from other pages
                        FocusManager.instance.primaryFocus?.unfocus();
                      })
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Recent workouts',
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: workoutListProvider.getWorkoutList().length,
                      itemBuilder: (context, index) => WorkoutTile(
                            title: workoutListProvider
                                .getWorkoutList()[workoutListProvider
                                        .getWorkoutList()
                                        .length -
                                    index -
                                    1]
                                .name,
                            subtitle: workoutListProvider
                                .getWorkoutList()[workoutListProvider
                                        .getWorkoutList()
                                        .length -
                                    index -
                                    1]
                                .date
                                .toString(),
                            deleteFunction: (context) {
                              workoutListProvider.deleteWorkout(
                                  workoutListProvider.getWorkoutList().length -
                                      index -
                                      1);
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      settings: const RouteSettings(
                                          name: 'WorkoutScreen'),
                                      builder: (context) => WorkoutScreen(
                                          workout: workoutListProvider
                                                  .getWorkoutList()[
                                              workoutListProvider
                                                      .getWorkoutList()
                                                      .length -
                                                  index -
                                                  1],
                                          index: index)));
                            },
                          )),
                ),
              ],
            ));
  }
}
