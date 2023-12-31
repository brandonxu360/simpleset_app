import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  final Function()? onTap;
  const MyBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
    );
  }
}
