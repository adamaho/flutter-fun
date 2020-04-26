import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  DividerWithText({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 0, right: 20.0),
            child: Divider(
              color: Colors.white,
              height: 36,
            ),
          ),
        ),
        Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 0),
            child: Divider(
              color: Colors.white,
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
