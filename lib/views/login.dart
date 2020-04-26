import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/common.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  bool validEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWithPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TitleWithDescription(
              title: "Welcome Back",
              description: "What is your email and password?",
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FormInput(
                    hintText: "Email",
                    validator: (value) {
                      if (!validEmail(value)) {
                        return "Are you sure that is your email?";
                      }
                      if (value.isEmpty) {
                        return "We need your email to know who you are.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  FormInput(
                    hintText: "Password",
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't come back without your password";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Button(
              text: "Login",
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  print(_email);
                  print(_password);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
