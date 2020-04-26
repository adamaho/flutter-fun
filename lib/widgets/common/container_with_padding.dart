import 'package:flutter/material.dart';

class ContainerWithPadding extends StatelessWidget {
  ContainerWithPadding({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: this.child,
    );
  }
}
