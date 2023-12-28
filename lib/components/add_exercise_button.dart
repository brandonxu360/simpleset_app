import 'package:flutter/material.dart';
import 'package:simpleset_app/screens/create_exercise_screen.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreateExercise())),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 10),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add), Text('Add Exercise')]),
      ),
    );
  }
}
