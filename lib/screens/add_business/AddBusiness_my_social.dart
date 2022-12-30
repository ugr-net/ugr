import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Session.dart';

class AddBusiness_my_social extends StatefulWidget {
  const AddBusiness_my_social({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_social> createState() => _AddBusiness_my_socialState();
}

class _AddBusiness_my_socialState extends State<AddBusiness_my_social> {
  var _fb = TextEditingController();
  var _ig = TextEditingController();
  var _tw = TextEditingController();
  var _yt = TextEditingController();
  @override
  void initState() {
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      _fb.text = await p.get("addBusinessFb").toString() == 'null'
          ? ''
          : p.get("addBusinessFb").toString();
      _ig.text = await p.get("addBusinessIg").toString() == 'null'
          ? ''
          : p.get("addBusinessIg").toString();
      _tw.text = await p.get("addBusinessTw").toString() == 'null'
          ? ''
          : p.get("addBusinessTw").toString();
      _yt.text = await p.get("addBusinessYt").toString() == 'null'
          ? ''
          : p.get("addBusinessYt").toString();
    }()
        .then((value) => setState(() {}));
    super.initState();
  }

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
              Icon(FontAwesomeIcons.message, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Business Social Media Handles"),
              SizedBox(
                height: 20,
              ),
              Input1(
                icon: Icons.facebook,
                placeholder: "Enter Facebook link here",
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: _fb,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessFb", _fb.text);
                  }
                },
              ),
              Input1(
                icon: FontAwesomeIcons.twitter,
                placeholder: "Enter Twitter link here",
                my: 10,
                textInputAction: TextInputAction.next,
                controller: _tw,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessTw", _tw.text);
                  }
                },
              ),
              Input1(
                icon: FontAwesomeIcons.instagram,
                placeholder: "Enter Instagram link here",
                my: 10,
                textInputAction: TextInputAction.next,
                controller: _ig,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessIg", _ig.text);
                  }
                },
              ),
              Input1(
                icon: FontAwesomeIcons.youtube,
                placeholder: "Enter Youtube link here",
                my: 10,
                textInputAction: TextInputAction.go,
                controller: _yt,
                onchange: (e) {
                  if (e.trim() != '') {
                    Session.add("addBusinessYt", _yt.text);
                  }
                },
                onSubmit: (e) => Navigator.pushNamed(
                    context, RouteManager.addBusiness_my_bank),
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
                        onClick: () {
                          Session.add("addBusinessYt", _yt.text);
                          Session.add("addBusinessFb", _fb.text);
                          Session.add("addBusinessTw", _tw.text);
                          Session.add("addBusinessIg", _ig.text);
                          Navigator.pushNamed(
                              context, RouteManager.addBusiness_my_bank);
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
