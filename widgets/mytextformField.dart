// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import "package:flutter/material.dart";

class MyTextFormField extends StatelessWidget {
  final Function(String?) validator;
  final String name;

  MyTextFormField({required this.name, required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        // Call the provided validator function and return its result
        if (validator != null) {
          return validator(value);
        }
        return null; // Return null if no validation function is provided
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
