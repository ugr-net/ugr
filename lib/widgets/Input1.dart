import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

import 'Btn1.dart';

class Input1 extends StatelessWidget {
  final String placeholder;
  final double my;
  final IconData icon;
  final TextInputAction textInputAction;
  final Function(String) onSubmit, onchange;
  final TextEditingController controller;
  final bool autofocus;
  const Input1(
      {Key key,
      this.placeholder = 'enter text',
      this.my = 3,
      this.onSubmit,
      this.onchange,
      this.controller,
      this.autofocus = false,
      this.textInputAction = TextInputAction.go,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: my),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        style: TextStyle(color: primaryColorO),
        controller: controller,
        clipBehavior: Clip.values[3],
        cursorColor: accentColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white38,
          hintText: placeholder,
          hintStyle: TextStyle(color: accentColor, fontSize: 14.4),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            icon,
            color: accentColor,
          ),
          iconColor: accentColor,
          focusColor: accentColor,
        ),
        textInputAction: textInputAction,
        onSubmitted: onSubmit,
        onChanged: onchange,
      ),
    );
  }
}
