import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/components/exerciseset_tile.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/num_textfield.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/models/exercise.dart';
import 'package:simpleset_app/models/exerciseset.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseScreen({super.key, required this.exercise});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final List<ExerciseSet> sets = [];

  TextEditingController weightTextController = TextEditingController();
  TextEditingController repTextController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  // Scroll function to automatically scroll to bottom as new sets are added
  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.exercise.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Set #'), Text('Weight'), Text('Reps')],
          ),
        ),
        (sets.isNotEmpty)
            ? Expanded(
                child: ListView.builder(
                  itemCount: sets.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) => ExerciseSetTile(
                    setNum: sets[index].order + 1,
                    weight: sets[index].weight,
                    reps: sets[index].reps,
                  ),
                ),
              )
            : const Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text('Lets record some sets!'),
              )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 40),
              Column(
                children: [
                  const Text('Set #'),
                  Text(
                    (sets.length + 1).toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text('Weight'),
                  ),
                  SizedBox(
                    width: 100,
                    child: NumTextField(
                      myTextController: weightTextController,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text('Reps'),
                  ),
                  SizedBox(
                    width: 100,
                    child: NumTextField(
                      myTextController: repTextController,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: MyButton(
              label: 'Record set',
              icon: const Icon(Icons.draw_rounded),
              onTap: () {
                setState(() {
                  int newReps = int.parse(repTextController.text);
                  double newWeight = double.parse(weightTextController.text);
                  sets.add(ExerciseSet(
                      order: sets.length, weight: newWeight, reps: newReps));

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollDown();
                  });
                });
                repTextController.clear();
              }),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 50, right: 20, left: 20, top: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: MyButton(
                  label: 'Cancel',
                  icon: const Icon(Icons.cancel),
                  onTap: () => Navigator.pop(context)),
            ),
            Expanded(
              child: MyButton(
                  label: 'Finish',
                  icon: const Icon(Icons.check),
                  onTap: () {
                    Provider.of<NewWorkoutProvider>(context, listen: false)
                        .addExercise(widget.exercise);

                    Provider.of<NewWorkoutProvider>(context, listen: false)
                        .addExerciseSetsToExercise(widget.exercise, sets);
                    Navigator.popUntil(
                        context, ModalRoute.withName('WorkoutScreen'));
                  }),
            ),
          ]),
        )
      ]),
    ));
  }
}
