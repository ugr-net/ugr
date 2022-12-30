import 'package:flutter/material.dart';
import 'package:ugrr/widgets/HeadingText2.dart';

import '../colors.dart';

class LikeButton extends StatefulWidget {
  final Color color;
  final IconData icon;
  final Function(bool) onTap;
  final bool isLiked;
  final String number;
  const LikeButton({
    Key key,
    this.color,
    this.onTap,
    this.icon,
    this.isLiked,
    this.number,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState(
        color: color,
        icon: icon,
        onTap: onTap,
        isLiked: isLiked,
        number: number,
      );
}

class _LikeButtonState extends State<LikeButton> {
  final Color color;
  final String number;
  final IconData icon;
  final Function(bool) onTap;
  final bool isLiked;
  _LikeButtonState({
    this.onTap,
    this.color,
    this.icon,
    this.isLiked = false,
    this.number,
  }) : super();

  bool _isLiked = false;

  @override
  void initState() {
    _isLiked = isLiked;
  }

  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 75,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: _isLiked ? accentColor.withOpacity(0.4) : opacified,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
          child: Row(
            children: [
              Icon(icon, color: color),
              SizedBox(
                width: 3,
              ),
              HeadingText2(text: "$number", color: color),
            ],
          ),
          onPressed: () {
            // onTap(_isLiked);
          }),
    );
  }
}
