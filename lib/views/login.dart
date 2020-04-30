import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'common.dart';
import '../widgets/common.dart';

class LoginView extends StatelessWidget {
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
            LoginSignupForm(
              buttonSubmitText: "Login",
              onSubmit: (form) {
                var json = form.toJson();

                print(json);
              },
            ),
          ],
        ),
      ),
    );
  }
}
