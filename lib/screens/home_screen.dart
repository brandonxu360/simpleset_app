import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/go_button.dart';
import 'package:simpleset_app/components/my_list_tile.dart';
import 'package:simpleset_app/components/my_textfield.dart';
import 'package:simpleset_app/data/workout_data.dart';
import 'package:simpleset_app/screens/new_workout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child) => Scaffold(
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
                          DateTime date = DateTime.now();
                          workoutNameController.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
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
                      itemCount: value.getWorkoutList().length,
                      itemBuilder: (context, index) => MyListTile(
                            title: value.getWorkoutList()[index].name,
                            subtitle:
                                value.getWorkoutList()[index].date.toString(),
                            deleteFunction: (context) {
                              value.deleteWorkout(index);
                            },
                          )),
                ),
              ],
            )));
  }
}
