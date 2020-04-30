import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './form.dart';
import '../../utils/validate.dart';
import '../../widgets/common.dart';

class LoginSignupForm extends StatefulWidget {
  final String buttonSubmitText;
  final void Function(LoginForm form) onSubmit;

  LoginSignupForm({
    @required this.buttonSubmitText,
    @required this.onSubmit
  });

  @override
  _LoginState createState() =>
      _LoginState(buttonSubmitText: this.buttonSubmitText, onSubmit: this.onSubmit);
}

class _LoginState extends State<LoginSignupForm> {
  final _formKey = GlobalKey<FormState>();

  _LoginState({
    @required this.buttonSubmitText,
    @required this.onSubmit
  });

  final String buttonSubmitText;
  final void Function(LoginForm form) onSubmit;

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
                    return "We need your password";
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
          text: this.buttonSubmitText,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              var form = new LoginForm(_email, _password);

              this.onSubmit(form);
            }
          },
        )
      ],
    );
  }
}
