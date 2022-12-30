import 'package:flutter/material.dart';
import 'package:ugrr/Session.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/Dropdown1.dart';

class AddBusiness_my_accBank extends StatefulWidget {
  const AddBusiness_my_accBank({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_accBank> createState() => _AddBusiness_my_accBankState();
}

class _AddBusiness_my_accBankState extends State<AddBusiness_my_accBank> {
  final _banks = const ["Access Bank", "UBA", "Zenith Bank"];
  var _phone;
  var _value;
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _phone = await p.get("addBusinessAccBank").toString() == 'null'
          ? ''
          : p.get("addBusinessAccBank").toString();
    }()
        .then((value) => setState(() {
              _value = _phone;
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
              Icon(Icons.money, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Bank "),
              SizedBox(
                height: 20,
              ),
              Material(
                type: MaterialType.transparency,
                color: Colors.transparent,
                child: Dropdown1(
                  array: _banks,
                  placeholder: "Select Bank",
                  value: _value,
                  onhasChanged: (e) {
                    Session.add("addBusinessAccBank", e);
                  },
                  key: GlobalKey(),
                ),
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
                    Expanded(
                      child: Btn1(
                        text: "next",
                        onClick: () {
                          Navigator.pushNamed(
                              context, RouteManager.addBusiness_my_confirm);
                        },
                      ),
                      flex: 5,
                    )
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
