// ignore_for_file: prefer_const_constructors

import 'package:android_sim/screens/signup.dart';
import 'package:android_sim/widgets/changescreen.dart';
import 'package:android_sim/widgets/mybutton.dart';
import 'package:android_sim/widgets/mytextformField.dart';
import 'package:android_sim/widgets/passwordtextformfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void vaildation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("Yes");
  } else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Email Is Invalid";
              }
              return "";
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            validator: (value) {
              if (value == "") {
                return "Please Fill Password";
              } else if (value!.length < 8) {
                return "Password Is Too Short";
              }
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyButton(
            onPressed: () {
              vaildation();
            },
            name: "Login",
          ),
          ChangeScreen(
            name: "SignUp",
            whichAccount: "I Don't Have An Account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
