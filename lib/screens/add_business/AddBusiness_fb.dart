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

class AddBusiness_my_fb extends StatefulWidget {
  const AddBusiness_my_fb({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_fb> createState() => _AddBusiness_my_fbState();
}

class _AddBusiness_my_fbState extends State<AddBusiness_my_fb> {
  var _phone = TextEditingController();
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _phone.text = await p.get("addBusinessFb").toString() == 'null'
          ? ''
          : p.get("addBusinessFb").toString();
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
              Icon(FontAwesomeIcons.facebook, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Facebook Handle"),
              SizedBox(
                height: 20,
              ),
              Input1(
                autofocus: true,
                icon: FontAwesomeIcons.facebookF,
                placeholder: "Enter business Facebook link",
                controller: _phone,
                textInputAction: TextInputAction.go,
                onSubmit: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessFb", _phone.text);
                    Navigator.pushNamed(
                        context, RouteManager.addBusiness_my_tw);
                  }
                },
                onchange: (e) {
                  Session.add("addBusinessFb", _phone.text);
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
                          Session.add("addBusinessFb", _phone.text);
                          Navigator.pushNamed(
                              context, RouteManager.addBusiness_my_tw);
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
