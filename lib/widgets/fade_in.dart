import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final int time;
  final Widget child;
  bool trans = false;

  FadeIn({Key key, this.time, this.child}) : super(key: key);

  FadeIn.top({Key key, this.time, this.child}) {
    this.trans = true;
  }

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  double _opacity = 0;
  double _offset = 50;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.time * 1000), () {
      setState(() {
        _opacity = 1;
        widget.trans ? _offset = 0 : _offset = 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.trans
        ? TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: _offset),
            duration: Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Transform.translate(
                  offset: Offset(0, value), child: child);
            },
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 1000),
              child: widget.child,
            ),
          )
        : AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 500),
            child: widget.child,
          );
  }
}
