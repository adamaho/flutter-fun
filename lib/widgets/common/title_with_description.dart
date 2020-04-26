import 'package:flutter/material.dart';

class TitleWithDescription extends StatelessWidget {
  TitleWithDescription({@required this.title, @required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            margin: EdgeInsets.only(bottom: 20),
          ),
          Container(
            child: Text(
              this.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            margin: EdgeInsets.only(bottom: 75),
          )
        ],
      ),
    );
  }
}
