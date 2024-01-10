import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final void Function()? onTap;
  const MyButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
        margin: const EdgeInsets.only(left: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon, Text(label)]),
      ),
    );
  }
}
