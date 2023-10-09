// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final Function()? onTap;
  final String name;
  ChangeScreen({required this.name, this.onTap, required this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(whichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
