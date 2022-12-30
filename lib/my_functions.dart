import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyFunctions {
  static IconData getMatchingIcon(String s) {
    var icon = Icons.circle_outlined;
    if (s.toLowerCase().contains("clothing")) {
      icon = FontAwesomeIcons.shirt;
    }
    if (s.toLowerCase().contains("computer")) {
      icon = FontAwesomeIcons.laptop;
    }
    if (s.toLowerCase().contains("beauty")) {
      icon = Icons.face;
    }
    if (s.toLowerCase().contains("food")) {
      icon = FontAwesomeIcons.utensils;
    }
    if (s.toLowerCase().contains("game")) {
      icon = FontAwesomeIcons.gamepad;
    }
    return icon;
  }
}
