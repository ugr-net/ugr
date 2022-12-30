import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class HeadingText2 extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const HeadingText2(
      {Key key, this.text, this.size = 15.0, this.color = primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
