import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class IconText1 extends StatelessWidget {
  final String t1, t2;
  final IconData icon;
  final Color color1, color2;

  const IconText1(this.t1, this.t2, this.icon,
      {Key key, this.color1 = accentColor, this.color2 = accentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Icon(
            icon,
            color: color1,
            size: 32,
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t1,
                style: TextStyle(
                  fontSize: 11,
                  color: color1,
                ),
              ),
              Text(
                t2,
                style: TextStyle(color: color2, fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
