import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  FormError({this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color.fromRGBO(255, 193, 7, 0.2),
      ),
      child: Text(
        this.error,
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
    );
  }
}
