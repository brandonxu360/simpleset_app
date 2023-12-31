import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/my_back_button.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/search_textfield.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/screens/add_exercise_sets_screen.dart';

class CreateExercise extends StatefulWidget {
  const CreateExercise({super.key});

  @override
  State<CreateExercise> createState() => _SearchExerciseScreenState();
}

class _SearchExerciseScreenState extends State<CreateExercise> {
  List<Exercise> searchResults = [];

  TextEditingController exerciseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutListProvider>(builder: (context, value, child) {
      return Scaffold(
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 25, right: 25, bottom: 40),
                child: Row(children: [
                  MyBackButton(onTap: () => Navigator.pop(context)),
                  const SizedBox(width: 25),
                  Expanded(
                      child: SearchTextField(
                          controller: exerciseNameController,
                          hintText: 'Name your exercise',
                          onQueryChanged: (String query) {
                            setState(() {
                              if (query.isNotEmpty) {
                                searchResults = value.exerciseList
                                    .where((item) => item.name
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .toList();
                              } else {
                                searchResults.clear();
                              }
                            });
                          }))
                ])),
            if (searchResults.isNotEmpty) const Text('Past exercises'),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(searchResults[index].name),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
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
      );
    });
  }
}
