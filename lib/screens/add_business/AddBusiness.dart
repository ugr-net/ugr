import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Session.dart';
import '../../widgets/MyScaffold.dart';

class AddBusiness extends StatelessWidget {
  AddBusiness({Key key}) : super(key: key);

  void clear() {
    Session.remove("addBusinessName");
    Session.remove("addBusinessIndustry");
    Session.remove("addBusinessPhone");
    Session.remove("addBusinessAddress");
    Session.remove("addBusinessFb");
    Session.remove("addBusinessIg");
    Session.remove("addBusinessTw");
    Session.remove("addBusinessYt");
    Session.remove("addBusinessAccName");
    Session.remove("addBusinessAccNumber");
    Session.remove("addBusinessAccBVN");
    Session.remove("addBusinessAccBank");
  }

  @override
  Widget build(BuildContext context) {
    this.clear();
    return Container(
      child: MyScaffold(
        appBarText: "Add Business",
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.shop, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(text: "Who Owns this Business"),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 270,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Btn1(
                  text: "Myself",
                  onClick: () {
                    var _a;
                    () async {
                      SharedPreferences p =
                          await SharedPreferences.getInstance();
                      _a = await p.setBool("addBusinessFor", true);
                    }()
                        .then((value) {
                      Navigator.pushNamed(context, RouteManager.addBusiness_my);
                    });
                  },
                ),
              ),
              Container(
                width: 270,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Btn1(
                  text: "Someone Else",
                  onClick: () {
                    var _a;
                    () async {
                      SharedPreferences p =
                          await SharedPreferences.getInstance();
                      _a = await p.setBool("addBusinessFor", false);
                    }()
                        .then((value) {
                      Navigator.pushNamed(context, RouteManager.addBusiness_my);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
