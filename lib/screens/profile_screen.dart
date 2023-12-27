import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),

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

          const SizedBox(
            height: 25,
          ),

          const Text(
            'Username',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(
            height: 10,
          ),

          const Text('email')
        ],
      ),
    );
  }
}
