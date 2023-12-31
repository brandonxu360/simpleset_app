import 'package:flutter/material.dart';

class NumTextField extends StatelessWidget {
  final TextEditingController myTextController;

  const NumTextField({super.key, required this.myTextController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      controller: myTextController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
