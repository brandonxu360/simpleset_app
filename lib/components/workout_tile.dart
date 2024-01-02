import 'package:flutter/material.dart';

class WorkoutTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function(BuildContext)? deleteFunction;
  final Function()? onTap;

  const WorkoutTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.deleteFunction,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 180,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ),
      ),
    );
  }
}
