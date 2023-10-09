import 'package:android_sim/screens/login.dart';
import 'package:android_sim/widgets/changescreen.dart';
import 'package:android_sim/widgets/mybutton.dart';
import 'package:android_sim/widgets/mytextformField.dart';
import 'package:android_sim/widgets/passwordtextformfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void vaildation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "UserName",
            validator: (value) {
              if (value == "") {
                return "Please Fill In UserName";
              } else if (value!.length < 6) {
                return "Username Is Too Short";
              }
              return "";
            },
          ),
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value == "") {
                return "Please Fill In Email";
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

              MyButton(
                onPressed: () {
                  vaildation();
                },
                name: "Login",
              );
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
              );
            },
          ),
          MyTextFormField(
            name: "Phone Number",
            validator: (value) {
              if (value == "") {
                return "Please Fill In Phone Number";
              } else if (value!.length < 9) {
                return "Please Input A Valid Phone Number";
              }
              return "";
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              vaildation();
            },
          ),
          ChangeScreen(
            name: "Login",
            whichAccount: "I Already Have An Account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
