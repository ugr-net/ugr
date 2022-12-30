import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/Dropdown1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Session.dart';

class AddBusiness_my_bank extends StatefulWidget {
  AddBusiness_my_bank({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_bank> createState() => _AddBusiness_my_bankState();
}

class _AddBusiness_my_bankState extends State<AddBusiness_my_bank> {
  final banks = ["Access Bank", "UBA", "Zenith Bank"];
  var _accName = TextEditingController();
  var _accBVN = TextEditingController();
  var _accNumber = TextEditingController();
  var _yt = TextEditingController();
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _accName.text = await p.get("addBusinessAccName").toString() == 'null'
          ? ''
          : p.get("addBusinessAccName").toString();
      _accBVN.text = await p.get("addBusinessAccBVN").toString() == 'null'
          ? ''
          : p.get("addBusinessAccBVN").toString();
      _accNumber.text = await p.get("addBusinessAccNumber").toString() == 'null'
          ? ''
          : p.get("addBusinessAccNumber").toString();
      _yt.text = await p.get("addBusinessYt").toString() == 'null'
          ? ''
          : p.get("addBusinessYt").toString();
    }()
        .then((value) => setState(() {}));
    super.initState();
  }

  String value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
        value: item,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.only(top: 50),
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          alignment: Alignment.center,
          height: Btn1.viewHeight - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.building, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Account Details"),
              SizedBox(
                height: 20,
              ),
              Input1(
                icon: Icons.account_circle_outlined,
                placeholder: "Enter Account Name",
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: _accName,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessAccName", _accName.text);
                  }
                },
              ),
              Input1(
                icon: Icons.numbers_rounded,
                placeholder: "Enter Account Number",
                my: 10,
                textInputAction: TextInputAction.next,
                controller: _accNumber,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessAccNumber", _accNumber.text);
                  }
                },
              ),
              Input1(
                icon: Icons.money,
                placeholder: "Enter BVN here",
                my: 10,
                textInputAction: TextInputAction.next,
                controller: _accBVN,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessAccBVN", _accBVN.text);
                  }
                },
              ),
              Dropdown1(
                array: banks,
                placeholder: "Select Bank",
              ),
              SizedBox(
                height: 10,
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
                        onClick: () => Navigator.pushNamed(
                            context, RouteManager.addBusiness_my_confirm),
                      ),
                      flex: 5,
                    ),
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
