import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './signup.dart';
import '../widgets/common.dart';

class CheckKey {
  final String key;

  CheckKey(this.key);

  Map<String, dynamic> toJson() => {
        'key': key,
      };

  Future<bool> checkKey() async {
    try {
      final http.Response response = await http.post(
        'http://192.168.0.159:8080/keys',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(this),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}

class KeyView extends StatefulWidget {
  @override
  _KeyViewState createState() => _KeyViewState();
}

class _KeyViewState extends State<KeyView> {
  final _formKey = GlobalKey<FormState>();

  String _key = '';
  String _keyError;

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
                    if (_keyError is String)
                      FormError(
                        error: _keyError,
                      ),
                    Button(
                      text: "Next",
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          var form = new CheckKey(_key);

                          form.checkKey().then((result) {
                            if (result) {
                              setState(() {
                                _keyError = null;
                              });
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => SignupView(),
                                ),
                              );
                            } else {
                              setState(() {
                                _keyError =
                                    "Your key is invalid or already taken.";
                              });
                            }
                          });
                        }
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
