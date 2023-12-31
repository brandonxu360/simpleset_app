import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function()? onTap;
  const SaveButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Icon(
            Icons.save,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
    );
  }
}
