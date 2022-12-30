import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Home_slider.dart';
import 'package:ugrr/widgets/MyScaffold.dart';
import 'package:ugrr/widgets/fade_in.dart';

import '../widgets/Btn1.dart';

class GeneratedQRScreen extends StatelessWidget {
  const GeneratedQRScreen({Key key}) : super(key: key);

  String getQrData() {
    String qrData = "hello";
    return qrData;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Btn1.viewWidth < 700 ? Axis.vertical : Axis.horizontal,
        children: [
          SilderWidget(),
          SizedBox(
            height: 60,
          ),
          FadeIn(
            time: 1,
            child: Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: BarcodeWidget(
                data: getQrData(),
                barcode: Barcode.qrCode(),
                color: accentColor,
                backgroundColor: bgColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Container(
          //   height: Btn1.viewHeight / 3,
          //   child: HomeAdContainer(),
          // ),
        ],
      ),
    );
  }
}
