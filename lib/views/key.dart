import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/common.dart';

class CheckKey {
  final String key;

  CheckKey(this.key);

  Map<String, dynamic> toJson() => {
    'key': key,
  };

  void submit() {
    print('submit');
  }
}

class KeyView extends StatefulWidget {
  @override
  _KeyViewState createState() => _KeyViewState();
}

class _KeyViewState extends State<KeyView> {
  final _formKey = GlobalKey<FormState>();

  String _key = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWithPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TitleWithDescription(
              title: "Let's get started",
              description: "Do you have access?",
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FormInput(
                    hintText: "Key",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "We need to check if you have access, enter your key.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _key = value;
                      });
                    },
                  ),
                  Button(
                    text: "Next",
                    onPressed: () {
                      print("submit");
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        var form = new CheckKey(_key);

                        form.submit();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
