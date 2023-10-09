// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function(String?) validator;
  final String name;
  final Function() onTap;
  PasswordTextFormField(
      {required this.onTap,
      required this.name,
      required this.obserText,
      required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
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
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
