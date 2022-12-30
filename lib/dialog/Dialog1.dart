import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/Container1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/routes/routes.dart';

import '../colors.dart';
import '../widgets/Btn1.dart';

class Dialog1 {
  static void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 280,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 280,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HeadingText1(text: 'You are not Logged In'),
                            SizedBox(
                              height: 20,
                            ),
                            Btn1(
                              text: 'Continue with Facebook',
                              onClick: () {
                                Navigator.of(context).pop();
                                Navigator.pushNamed(
                                    context, RouteManager.dashboard);
                              },
                              color: bgColor,
                              withIcon: true,
                              icon: Icons.facebook_sharp,
                              bgc: MyColor.fbColor,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Btn1(
                              text: 'Cancel',
                              color: bgColor,
                              onClick: () => Navigator.of(context).pop(),
                              bgc: MyColor.ytColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
