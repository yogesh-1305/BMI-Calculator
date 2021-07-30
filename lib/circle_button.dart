import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({@required this.icon, @required this.function});

  final IconData? icon;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white60,
      elevation: 0,
      foregroundColor: Colors.white,
      onPressed: function,
      child: Icon(icon),
    );
  }
}
