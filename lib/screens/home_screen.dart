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
            appBar: AppBar(
                centerTitle: true, title: const Text('S I M P L E S E T')),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 50, right: 25, left: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                            hintText: 'Name a new workout!',
                            obscureText: false,
                            controller: workoutNameController),
                      ),
                      const SizedBox(width: 10),
                      GoButton(onTap: () {})
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: value.getWorkoutList().length,
                      itemBuilder: (context, index) => MyListTile(
                            title: value.getWorkoutList()[index].name,
                            subtitle:
                                value.getWorkoutList()[index].date.toString(),
                          )),
                ),
              ],
            )));
  }
}
