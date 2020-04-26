import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({@required this.onPressed, @required this.text });

  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Text(
          this.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: this.onPressed,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}