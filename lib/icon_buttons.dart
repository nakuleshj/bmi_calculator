import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  IconButtons({this.ico});
  final IconData ico;
  @override
  Widget build(BuildContext context) {
    return Icon(
      ico,
      color: Colors.grey[400],
      size: 50,
    );
  }
}
