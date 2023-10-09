// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String name;
  MyButton({required this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
            padding: const EdgeInsets.all(12.0),
            backgroundColor: Colors.pink,
          ),
          onPressed: onPressed,
          child: Text(name),
        ));
  }
}
