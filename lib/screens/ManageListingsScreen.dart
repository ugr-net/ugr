import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/MyScaffold.dart';

import '../widgets/BusinessCard1.dart';

class ManageListings extends StatelessWidget {
  const ManageListings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final businesses = [
      {
        "name": "Grace Bakery",
        "industry": "Food and Bakery",
        "img": "img1.png"
      },
      {
        "name": "PreshyYours",
        "industry": "Beauty and Makeup",
        "img": "img1.png"
      },
      {"name": "Discord", "industry": "Gaming", "img": "img1.png"},
      {"name": "Discord", "industry": "Gaming", "img": "img1.png"},
      {"name": "Discord", "industry": "Gaming", "img": "img1.png"},
      {"name": "Discord", "industry": "Gaming", "img": "img1.png"},
      {"name": "Fiverr", "industry": "ICT and Computer", "img": "img1.png"},
    ];
    return MyScaffold(
        appBarText: "Manage Listings",
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ...businesses.map((each) {
                      return BusinessCard1(
                        name: each["name"].toString(),
                        industry: each["industry"].toString(),
                        img: each["img"].toString(),
                      );
                    }).toList(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            Positioned(
              bottom: 50,
              right: 20,
              child: Container(
                height: 50,
                width: 145,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: accentColor.withOpacity(0.2),
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      color: bgColor.withOpacity(0.2),
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Btn1(
                  icon: Icons.add,
                  text: "Add Business",
                  withIcon: true,
                  onClick: () =>
                      Navigator.pushNamed(context, RouteManager.addBusiness),
                ),
              ),
            )
          ],
        ));
  }
}
