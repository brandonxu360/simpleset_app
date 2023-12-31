import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/go_button.dart';
import 'package:simpleset_app/components/my_textfield.dart';
import 'package:simpleset_app/components/wokout_tile.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/screens/_new_workout_screen.dart';
import 'package:simpleset_app/screens/existing_workout_screen.dart';
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
            Scaffold(
                body: Column(
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
                                settings: const RouteSettings(
                                    name: 'NewWorkoutScreen'),
                                builder: (context) => NewWorkoutScreen(
                                  workoutName: workoutName,
                                  date: date,
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
                Expanded(
                  child: ListView.builder(
                      itemCount: workoutListProvider.getWorkoutList().length,
                      itemBuilder: (context, index) => WorkoutTile(
                            title: workoutListProvider
                                .getWorkoutList()[index]
                                .name,
                            subtitle: workoutListProvider
                                .getWorkoutList()[index]
                                .date
                                .toString(),
                            deleteFunction: (context) {
                              workoutListProvider.deleteWorkout(index);
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      settings: const RouteSettings(
                                          name: 'NewWorkoutScreen'),
                                      builder: (context) =>
                                          ExistingWorkoutScreen(index: index)));
                            },
                          )),
                ),
              ],
            )));
  }
}
