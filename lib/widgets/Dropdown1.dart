// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:ugrr/widgets/Btn1.dart';

import '../colors.dart';
import 'Container1.dart';

class Dropdown1 extends StatefulWidget {
  final List<String> array;
  final Color color;
  final String placeholder;
  final String value;
  final double my;
  final Function(String) onhasChanged;
  const Dropdown1({
    Key key,
    this.array,
    this.onhasChanged,
    this.color = accentColor,
    this.placeholder = "Select...",
    this.my = 3,
    this.value,
  }) : super(key: key);

  @override
  State<Dropdown1> createState() => _Dropdown1State(
        array: array,
        color: color,
        my: my,
        onhasChanged: onhasChanged,
        placeholder: placeholder,
        value: value,
      );
}

class _Dropdown1State extends State<Dropdown1> {
  final List<String> array;
  final Color color;
  final String placeholder;
  final String value;
  final double my;
  final Function(String) onhasChanged;
  _Dropdown1State(
      {this.array,
      this.color,
      this.my,
      this.onhasChanged,
      this.placeholder,
      this.value})
      : super();

  var item, _value;

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      child: Text(item,
          style: TextStyle(
            color: primaryColorO,
          )),
      value: item,
    );
  }

  @override
  void initState() {
    if (this.value != '') {
      setState(() {
        _value = value;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: Btn1.viewWidth > 600 ? 500 : 350),
      child: Container1(
        my: my,
        opacity: .2,
        height: 50,
        child: DropdownButton<dynamic>(
          dropdownColor: bgColor,
          borderRadius: BorderRadius.circular(20),
          underline: Container(),
          hint: Text(
            placeholder,
            style: TextStyle(color: accentColor),
          ),
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: color,
          ),
          iconSize: 20,
          value: _value,
          isExpanded: true,
          items: ((array.map(buildMenuItem)).toList()),
          onChanged: (value) {
            setState(() => this._value = value);
            onhasChanged(value);
          },
        ),
      ),
    );
  }
}
