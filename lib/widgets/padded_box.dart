import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class PaddedBox extends StatelessWidget {
  final double width, height, padding;
  final Widget child;
  final Color color;

  PaddedBox(
    this.width,
    this.height,
    this.child, {
    Key key,
    this.color = opacified,
    this.padding = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
