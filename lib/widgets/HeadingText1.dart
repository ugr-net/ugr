import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class HeadingText1 extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const HeadingText1(
      {Key key, this.text, this.size = 17.0, this.color = accentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
