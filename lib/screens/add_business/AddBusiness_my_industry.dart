import 'package:flutter/material.dart';
import 'package:ugrr/Session.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/Dropdown1.dart';

class AddBusiness_my_industry extends StatefulWidget {
  const AddBusiness_my_industry({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_industry> createState() =>
      _AddBusiness_my_industryState();
}

class _AddBusiness_my_industryState extends State<AddBusiness_my_industry> {
  final List<String> _industries = ["Clothing", "Computer and ICT"];
  var _value;

  String _inputValue = '';
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _inputValue = await p.get("addBusinessIndustry").toString() == 'null'
          ? ''
          : p.get("addBusinessIndustry").toString();
    }()
        .then((value) => setState(() {
              _value = _inputValue;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          alignment: Alignment.center,
          height: Btn1.viewHeight - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.business, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Industry"),
              SizedBox(
                height: 20,
              ),
              Material(
                type: MaterialType.transparency,
                color: Colors.transparent,
                child: Dropdown1(
                  array: _industries,
                  placeholder: "Select Industry",
                  value: _value,
                  onhasChanged: (e) {
                    Session.add("addBusinessIndustry", e);
                    setState(() {
                      _value = e;
                      _inputValue = e;
                    });
                  },
                  key: GlobalKey(),
                ),
              ),
              Container(
                width: Btn1.viewWidth - 20,
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 20,
                alignment: Alignment.topLeft,
                child: HeadingText2(
                    text: "this field is required",
                    size: 14,
                    color: accentColor),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: Btn1.viewWidth - 20,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Btn1(
                        text: "back",
                        onClick: () => Navigator.pop(context, false),
                        bgc: bgColor,
                        color: accentColor,
                      ),
                      flex: 5,
                    ),
                    _inputValue.trim() != ''
                        ? Expanded(
                            child: Btn1(
                              text: "next",
                              onClick: () {
                                Session.add("addBusinessIndustry", _value);
                                Navigator.pushNamed(
                                    context, RouteManager.addBusiness_my_phone);
                              },
                            ),
                            flex: 5,
                          )
                        : SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
