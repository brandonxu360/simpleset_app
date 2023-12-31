import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onQueryChanged;

  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onQueryChanged});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onQueryChanged,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      decoration: InputDecoration(
          hintText: widget.hintText,
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
