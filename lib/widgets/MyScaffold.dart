import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';

import '../dialog/Dialog1.dart';
import '../routes/routes.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final String appBarText;
  final List<Widget> appBarActions;
  final bool showBack;
  MyScaffold({
    Key key,
    this.body,
    this.appBarText,
    this.appBarActions = const [],
    this.showBack = true,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              child: ListView(children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      showBack
                          ? IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: accentColor,
                              ))
                          : SizedBox(),
                      MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset(
                            "assets/images/logo2.png",
                          ),
                        ),
                        onPressed: () => Navigator.popAndPushNamed(
                            context, RouteManager.homePage),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  height: 60,
                  alignment: Alignment.center,
                ),
                Container(height: Btn1.viewHeight - 150, child: body)
              ]),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
            ),
          ),
          Container(
            height: 70,
            padding: EdgeInsets.only(bottom: 20),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => false);
                        Navigator.pushNamed(context, RouteManager.homePage);
                        // Dialog1.showMyDialog(context);
                        Navigator.pushNamed(
                            context, RouteManager.generateQRCode);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: accentColor,
                        size: 18,
                      )),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => false);
                        Navigator.pushNamed(context, RouteManager.homePage);
                        // Dialog1.showMyDialog(context);
                        Navigator.pushNamed(context, RouteManager.dashboard);
                      },
                      icon: Icon(
                        FontAwesomeIcons.user,
                        color: accentColor,
                        size: 18,
                      )),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
