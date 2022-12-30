import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/my_functions.dart';
import 'package:ugrr/widgets/Container1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/widgets/padded_box.dart';

class BusinessCard1 extends StatelessWidget {
  final String name, industry;
  final String img;

  const BusinessCard1({
    Key key,
    this.name,
    this.industry,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(right: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: accentColor.withOpacity(0.1),
              blurRadius: 20,
            ),
            BoxShadow(
              offset: Offset(0, -5),
              color: bgColor.withOpacity(0.7),
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        height: 102,
        onPressed: () =>
            Navigator.pushNamed(context, RouteManager.viewBusiness),
        child: Flex(direction: Axis.horizontal, children: [
          Transform.translate(
            offset: Offset(-10, 0),
            child: Container(
              width: 98,
              color: primaryColorO,
              child: Image.asset(
                'assets/images/' + img + '',
                height: 98,
                width: 98,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText1(
                text: name,
                color: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaddedBox(
                      180,
                      30,
                      Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            size: 13,
                            color: MyColor.fbColor,
                          ),
                          HeadingText2(
                            text: "72",
                            size: 13,
                            color: MyColor.fbColor,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            FontAwesomeIcons.instagram,
                            size: 13,
                            color: MyColor.igColor,
                          ),
                          HeadingText2(
                            text: "200",
                            size: 13,
                            color: MyColor.igColor,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            FontAwesomeIcons.twitter,
                            size: 13,
                            color: MyColor.twColor,
                          ),
                          HeadingText2(
                            text: "200",
                            size: 13,
                            color: MyColor.twColor,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            FontAwesomeIcons.youtube,
                            size: 13,
                            color: MyColor.ytColor,
                          ),
                          HeadingText2(
                            text: "200",
                            size: 13,
                            color: MyColor.ytColor,
                          ),
                        ],
                      ),
                    ),
                    PaddedBox(
                        40,
                        35,
                        Icon(
                          MyFunctions.getMatchingIcon(industry),
                          color: accentColor,
                        ))
                  ],
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
