import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/widgets/btn2.dart';

import '../widgets/Container1.dart';
import '../widgets/MyScaffold.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  Image logo;
  @override
  void initState() {
    super.initState();
    logo = Image.asset(
      'assets/images/logo2.png',
      scale: 0.6,
      width: 100,
      height: 120,
      fit: BoxFit.contain,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(logo.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarText: "Support",
      body: ListView(children: [
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: logo,
        ),
        Container(
          height: 300,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText2(text: "Follow Us"),
              SizedBox(
                height: 20,
              ),
              Btn2(
                text: "Facebook",
                withIcon: true,
                icon: Icons.facebook,
                // color: MyColor.fbColor,
              ),
              SizedBox(
                height: 8,
              ),
              Btn2(
                text: "Instagram",
                withIcon: true,
                icon: FontAwesomeIcons.instagram,
                // color: MyColor.igColor,
              ),
              SizedBox(
                height: 8,
              ),
              Btn2(
                text: "Twitter",
                withIcon: true,
                icon: FontAwesomeIcons.twitter,
                // color: MyColor.twColor,
              ),
              SizedBox(
                height: 8,
              ),
              Btn2(
                text: "Youtube",
                withIcon: true,
                icon: FontAwesomeIcons.youtube,
                // color: MyColor.ytColor,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
