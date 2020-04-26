import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'login.dart';
import 'signup.dart';
import '../widgets/common.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWithPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TitleWithDescription(
              title: "Tallii",
              description: "Keep score.",
            ),
            Button(
              text: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
            DividerWithText(
              text: "OR",
            ),
            Button(
              text: "Sign up",
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => SignupView()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
