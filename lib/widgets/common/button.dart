import 'package:flutter/material.dart';

enum ButtonType { Primary, Secondary }

class Button extends StatelessWidget {
  Button({
    @required this.onPressed,
    @required this.text,
    this.type = ButtonType.Primary,
  });

  final GestureTapCallback onPressed;
  final String text;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: FlatButton(
        child: Text(
          this.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: this.onPressed,
        color: this.type == ButtonType.Primary ? Colors.white : Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
