import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/go_button.dart';
import 'package:simpleset_app/components/my_textformfield.dart';
import 'package:simpleset_app/components/workout_tile.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_data_provider.dart';
import 'package:simpleset_app/screens/workout_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 8),
              Text('New Workout'),
            ],
          ),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(
              child: MyTextFormField(
                hintText: 'Name a new workout!',
                obscureText: false,
                controller: workoutNameController,
                showIcon: false,
                icon: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 10),
            // Navigates to Workout page to build new workout
            GoButton(onTap: () {
              if (workoutNameController.text != '') {
                String workoutName = workoutNameController.text;

                Provider.of<NewWorkoutProvider>(context, listen: false)
                    .setName(workoutName);
                Provider.of<NewWorkoutProvider>(context, listen: false)
                    .setDate(DateTime.now());

                workoutNameController.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(name: 'WorkoutScreen'),
                      builder: (context) => const WorkoutScreen(),
                    ));
              } else {
                // TODO: REQUIRE NONEMPTY NAME
              }
              // Unfocus textfield upon returning to Homepage from other pages
              FocusManager.instance.primaryFocus?.unfocus();
            })
          ]),
          const SizedBox(height: 30),
          const Row(
            children: [
              SizedBox(width: 8),
              Text('Recent Workouts'),
            ],
          ),
          const SizedBox(height: 8),
          Consumer<WorkoutDataProvider>(
              builder: (context, value, child) => Expanded(
                    child: ListView.builder(
                      itemCount: value.workouts.length,
                      itemBuilder: (context, index) => WorkoutTile(
                          workout:
                              value.workouts[value.workouts.length - 1 - index],
                          onTap: () {}),
                    ),
                  ))
        ],
      ),
    );
  }
}
