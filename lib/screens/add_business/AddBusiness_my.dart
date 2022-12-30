import 'package:flutter/material.dart';
import 'package:ugrr/Session.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../myColors.dart';
import '../../widgets/HeadingText2.dart';

class AddBusiness_my extends StatefulWidget {
  const AddBusiness_my({Key key}) : super(key: key);

  @override
  State<AddBusiness_my> createState() => _AddBusiness_myState();
}

class _AddBusiness_myState extends State<AddBusiness_my> {
  var _nameController = TextEditingController();
  String _inputValue = '';
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _nameController.text = await p.get("addBusinessName").toString() == 'null'
          ? ''
          : p.get("addBusinessName").toString();
    }()
        .then((value) => setState(() {
              _inputValue = _nameController.text;
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
              Icon(FontAwesomeIcons.shop, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Name"),
              SizedBox(
                height: 20,
              ),
              Input1(
                autofocus: true,
                controller: _nameController,
                icon: Icons.business_center,
                placeholder: "Enter business Name here",
                textInputAction: TextInputAction.go,
                onSubmit: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessName", _nameController.text);
                    Navigator.pushNamed(
                        context, RouteManager.addBusiness_my_industry);
                  }
                },
                onchange: (e) {
                  setState(() {
                    _inputValue = e;
                  });
                },
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
                        onClick: () {
                          Navigator.pop(context, false);
                        },
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
                                Session.add(
                                    "addBusinessName", _nameController.text);
                                Navigator.pushNamed(context,
                                    RouteManager.addBusiness_my_industry);
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
