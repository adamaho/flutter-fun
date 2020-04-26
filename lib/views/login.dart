import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/common.dart';

class LoginView extends StatefulWidget {
  String _email;
  String _password;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

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
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      print(value);
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        focusColor: Colors.white),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
            Button(
              text: "Login",
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}