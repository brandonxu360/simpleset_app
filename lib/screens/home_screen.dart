import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/go_button.dart';
import 'package:simpleset_app/components/my_listtile.dart';
import 'package:simpleset_app/components/my_textfield.dart';
import 'package:simpleset_app/data/workout_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
                            controller: workoutNameController),
                      ),
                      const SizedBox(width: 10),
                      GoButton(onTap: () {
                        value.addWorkout(
                            workoutNameController.text, 'dateValue');
                        workoutNameController.clear();
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
