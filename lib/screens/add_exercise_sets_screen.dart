import 'package:flutter/material.dart';
import 'package:simpleset_app/components/exerciseset_tile.dart';
import 'package:simpleset_app/components/my_button.dart';
import 'package:simpleset_app/components/num_textfield.dart';
import 'package:simpleset_app/data/new_workout_provider.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app/models/exercise_set.dart';

class AddExerciseSetsScreen extends StatefulWidget {
  final String exerciseName;

  const AddExerciseSetsScreen({super.key, required this.exerciseName});

  @override
  State<AddExerciseSetsScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseSetsScreen> {
  TextEditingController weightTextController = TextEditingController();
  TextEditingController repTextController = TextEditingController();

  List<ExerciseSet> newSetList = [];

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<WorkoutListProvider, NewWorkoutProvider>(
      builder: (context, workoutListProvider, newWorkoutProvider, child) =>
          Scaffold(
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(widget.exerciseName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 24)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Set #'),
                  //const SizedBox(width: 50),
                  Text('Weight'),
                  //const SizedBox(width: 50),
                  Text('Reps')
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: newSetList.length,
              controller: _controller,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: newSetList.length == 1
                          ? BorderRadius.circular(12)
                          : index == 0
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))
                              : index == newSetList.length - 1
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12))
                                  : BorderRadius.circular(0),
                    ),
                    child: ExerciseSetTile(mySet: newSetList[index])),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      const Text('Set #'),
                      Text(
                        (newSetList.length + 1).toString(),
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
                        width: 120,
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
                        width: 120,
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
                      double newWeight =
                          double.parse(weightTextController.text);
                      newSetList.add(ExerciseSet(
                          setNum: newSetList.length + 1,
                          date: DateTime.now(),
                          weight: newWeight,
                          reps: newReps));
                    });
                    _scrollDown();
                    repTextController.clear();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 50, right: 20, left: 20, top: 10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        newWorkoutProvider.addExercise(
                            widget.exerciseName, newSetList);
                        Navigator.popUntil(
                            context, ModalRoute.withName('NewWorkoutScreen'));
                      }),
                ),
              ]),
            )
          ]))),
    );
  }
}
