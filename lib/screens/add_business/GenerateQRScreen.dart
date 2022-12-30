import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/MyScaffold.dart';

class GenerateQRScreen extends StatelessWidget {
  const GenerateQRScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBarText: "Generate QR",
        body: MyScaffold(
          appBarText: "Generate QR",
          body: Container(
            child: Flex(
              direction: Axis.vertical,
              children: [
                BarcodeWidget(
                  data: '',
                  barcode: Barcode.qrCode(),
                  color: accentColor,
                  backgroundColor: bgColor,
                ),
                SizedBox(
                  height: 20,
                ),
                HeadingText1(
                  text: "Scan the code",
                )
              ],
            ),
          ),
        ));
  }
}
