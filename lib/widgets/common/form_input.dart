import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  FormInput({
    @required this.hintText,
    @required this.onSaved,
    @required this.validator,
    this.obscureText = false,
  });

  final String hintText;
  final FormFieldSetter<String> onSaved;
  final bool obscureText;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: this.obscureText,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          filled: true,
          fillColor: Color.fromRGBO(45, 45, 45, 0.8),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusColor: Colors.amber,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          hintText: this.hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.5),
          ),
        ),
        validator: this.validator,
        onSaved: this.onSaved,
      ),
    );
  }
}
