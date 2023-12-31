import 'package:flutter/material.dart';
import 'package:simpleset_app/data/workout_list_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutListProvider>(
        builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // Profile pic
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context).colorScheme.primary),
                  child: const Icon(
                    Icons.person,
                    size: 64,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Username',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text('email@gmail.com'),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          value.workoutList.length.toString(),
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        const Text('workouts')
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          value.workoutList.length.toString(),
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        const Text('statistic')
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          value.workoutList.length.toString(),
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        const Text('statistic')
                      ],
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    width: 180,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                )
              ],
            ));
  }
}
