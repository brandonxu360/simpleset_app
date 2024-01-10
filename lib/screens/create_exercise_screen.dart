import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/search_textfield.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_data_provider.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/screens/exercise_screen.dart';

class CreateExerciseScreen extends StatefulWidget {
  const CreateExerciseScreen({super.key});

  @override
  State<CreateExerciseScreen> createState() => _CreateExerciseScreenState();
}

class _CreateExerciseScreenState extends State<CreateExerciseScreen> {
  // List of exercises in database that contains the user input as prefix
  List<Exercise> queryResults = [];

  final TextEditingController exerciseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(children: [
          Row(children: [
            MyBackButton(onTap: () => Navigator.pop(context)),
            const SizedBox(width: 25),
            Expanded(
              child: SearchTextField(
                controller: exerciseNameController,
                hintText: 'Exercise name',
                onQueryChanged: (query) async {
                  if (query.isNotEmpty) {
                    final results = await Provider.of<WorkoutDataProvider>(
                      context,
                      listen: false,
                    ).queryExerciseWithPrefix(query);

                    setState(() {
                      queryResults = results;
                    });
                  } else {
                    setState(() {
                      queryResults.clear();
                    });
                  }
                },
              ),
            ),
          ]),

          // Previous exercise suggestions
          (queryResults.isNotEmpty)
              ? Expanded(
                  child: ListView.builder(
                      itemCount: queryResults.length,
                      itemBuilder: (context, index) =>
                          Text(queryResults[index].name)))
              : const Expanded(
                  child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text('Previous exercises will appear here!'),
                )),

          MyButton(
              label: 'Create Exercise',
              icon: const Icon(Icons.add_rounded),
              onTap: () {
                final int order =
                    Provider.of<NewWorkoutProvider>(context, listen: false)
                        .newExercisesAndSets
                        .keys
                        .length;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ExerciseScreen(
                            exercise: Exercise(
                                name: exerciseNameController.text,
                                order: order)))));
              })
        ]),
      ),
    );
  }
}
