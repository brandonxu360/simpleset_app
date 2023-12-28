import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/exercise_tile.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/my_textfield.dart';
import 'package:simpleset_app/data/workout_data.dart';
import 'package:simpleset_app/screens/add_exercise_sets_screen.dart';

class CreateExercise extends StatefulWidget {
  const CreateExercise({super.key});

  @override
  State<CreateExercise> createState() => _SearchExerciseScreenState();
}

class _SearchExerciseScreenState extends State<CreateExercise> {
  TextEditingController exerciseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                child: Row(children: [
                  const MyBackButton(),
                  const SizedBox(width: 25),
                  Expanded(
                    child: MyTextField(
                      hintText: 'Exercise name',
                      obscureText: false,
                      controller: exerciseNameController,
                      showIcon: false,
                      icon: const Icon(Icons.search),
                    ),
                  )
                ])),
            if (value.exerciseList.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text('No exercises found...be the first?'),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: value.exerciseList.length,
                itemBuilder: (context, index) => ExerciseTile(
                  exerciseName: value.exerciseList[index].name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                  label: 'Create Exercise',
                  icon: const Icon(Icons.add),
                  onTap: () {
                    String exerciseName = exerciseNameController.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddExerciseSetsScreen(
                                  exerciseName: exerciseName,
                                )));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
