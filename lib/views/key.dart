import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'common.dart';
import '../widgets/common.dart';

class KeyView extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
