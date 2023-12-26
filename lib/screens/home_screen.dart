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
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                          hintText: 'Name the workout!',
                          obscureText: false,
                          controller: workoutNameController),
                    ),
                    GoButton(onTap: () {})
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: value.getWorkoutList().length,
                      itemBuilder: (context, index) => MyListTile(
                            title: value.getWorkoutList()[index].name,
                          )),
                ),
              ],
            )));
  }
}
