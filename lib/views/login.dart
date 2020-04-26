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
                      if (value.isEmpty) {
                        return 'We need your email so we know who you are.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  FormInput(
                    hintText: "Password",
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
