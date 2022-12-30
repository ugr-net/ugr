import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Session.dart';

class AddBusiness_my_info extends StatefulWidget {
  const AddBusiness_my_info({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_info> createState() => _AddBusiness_my_infoState();
}

class _AddBusiness_my_infoState extends State<AddBusiness_my_info> {
  var _phone = TextEditingController();
  var _address = TextEditingController();
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _phone.text = await p.get("addBusinessPhone").toString() == 'null'
          ? ''
          : p.get("addBusinessPhone").toString();
      _address.text = await p.get("addBusinessAddress").toString() == 'null'
          ? ''
          : p.get("addBusinessAddress").toString();
    }()
        .then((value) => setState(() {}));
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
              Icon(Icons.location_city, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Information"),
              SizedBox(
                height: 20,
              ),
              Input1(
                icon: Icons.phone,
                autofocus: true,
                controller: _phone,
                placeholder: "Enter business Phone number here",
                textInputAction: TextInputAction.next,
                onSubmit: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessPhone", _phone.text);
                  }
                },
              ),
              Input1(
                icon: Icons.location_city,
                controller: _address,
                placeholder: "Enter business Address here",
                my: 10,
                textInputAction: TextInputAction.go,
                onSubmit: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessAddress", _address.text);
                  }
                },
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
                          Session.add("addBusinessPhone", _phone.text);
                          Session.add("addBusinessAddress", _address.text);
                          Navigator.pushNamed(
                              context, RouteManager.addBusiness_my_social);
                        },
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
