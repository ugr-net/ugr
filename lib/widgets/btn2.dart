import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class Btn2 extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final IconData icon;
  final double pt, pb, pr, pl, mt, mb, mr, ml;
  final bool withIcon;
  final Color bgc, color;
  final double gap;

  Btn2({
    Key key,
    this.text,
    this.onClick,
    this.mb = 0,
    this.mt = 0,
    this.mr = 0,
    this.ml = 0,
    this.pt = 15,
    this.pb = 15,
    this.pl = 10,
    this.pr = 10,
    this.gap = 10,
    this.icon = Icons.abc,
    this.withIcon = false,
    this.bgc = bgColor,
    this.color = accentColor,
  }) : super(key: key);

  Btn2.iconOnly({
    Key key,
    this.text = '',
    this.onClick,
    this.mb = 0,
    this.mt = 0,
    this.mr = 0,
    this.ml = 0,
    this.pt = 0,
    this.pb = 0,
    this.pl = 0,
    this.pr = 0,
    this.gap = 0,
    this.icon = Icons.abc,
    this.withIcon = true,
    this.bgc = accentColor,
    this.color = bgColor,
  }) : super(key: key);

  static var viewWidth;
  static var viewHeight;

  @override
  Widget build(BuildContext context) {
    viewWidth = MediaQuery.of(context).size.width;
    viewHeight = MediaQuery.of(context).size.height;
    return !withIcon
        ? Container(
            constraints: BoxConstraints(maxWidth: 280),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: mt, bottom: mb, right: mr, left: ml),
            child: ElevatedButton(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: onClick,
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shadowColor: opacified,
                  minimumSize: Size(double.infinity, 50),
                  padding:
                      EdgeInsets.only(top: pt, bottom: pb, right: pr, left: pl),
                  primary: bgc,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
          )
        : Container(
            // constraints: BoxConstraints(maxWidth: 280),
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.only(top: mt, bottom: mb, right: mr, left: ml),
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon, color: color),
                  SizedBox(
                    width: gap,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              onPressed: onClick,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                padding:
                    EdgeInsets.only(top: pt, bottom: pb, right: pr, left: pl),
                primary: bgc,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          );
  }
}
