import 'package:flutter/material.dart';

class BarChartBar extends StatelessWidget {
  final double width;
  final IconData icon;
  final Color color;
  const BarChartBar({Key key, this.width, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 25,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 15,
            ),
          ]),
    );
  }
}
