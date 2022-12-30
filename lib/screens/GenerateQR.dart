import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/Dropdown1.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/widgets/Input1.dart';

import '../widgets/MyScaffold.dart';

class GenerateQRScreen extends StatelessWidget {
  const GenerateQRScreen({Key key}) : super(key: key);

  List generateList() {
    const array = ["Great bakery", "Peace Transpors CO", "Hello Bites"];
    return array;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBarText: "Generate QR code",
        body: Container(
          color: bgColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code_rounded,
                size: 120,
                color: accentColor,
              ),
              SizedBox(
                height: 50,
              ),
              HeadingText2(
                text: 'Generate QR code to continue',
                size: 18,
                color: accentColor,
              ),
              SizedBox(
                height: 20,
              ),
              Dropdown1(
                array: generateList(),
                placeholder: "Select Business",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Btn1(
                  text: "NEXT",
                  onClick: () => Navigator.pushNamed(
                      context, RouteManager.generatedQRScreen),
                  withIcon: false,
                ),
              )
            ],
          ),
        ));
  }
}
