import 'package:flutter/material.dart';

class Container1 extends StatelessWidget {
  final double my, padding, height, opacity, mx;
  final Widget child;
  const Container1({
    Key key,
    this.padding = 10,
    this.opacity = 0.05,
    this.my = 3,
    this.mx = 15,
    this.child = const Text(''),
    this.height = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: my),
      padding: EdgeInsets.symmetric(horizontal: mx, vertical: 5),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: height,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(opacity),
        ),
        child: child,
      ),
    );
  }
}
