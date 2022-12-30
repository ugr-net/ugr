import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final String type;
  final int speed;

  CustomPageRoute({
    this.child,
    this.type = 'rtl',
    this.speed = 500,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(
              microseconds: speed,
            ));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget) {
    switch (type) {
      case "scale":
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case "ltr":
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case "rtl":
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case "utd":
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case "dtu":
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      default:
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
    }
  }
}
