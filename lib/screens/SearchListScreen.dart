import 'package:flutter/material.dart';
// import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/BusinessCard1.dart';
// import 'package:ugrr/widgets/HeadingText2.dart';

import '../widgets/MyScaffold.dart';

class SearchList extends StatelessWidget {
  SearchList({Key key}) : super(key: key);

  final businesses = [
    {"name": "Grace Bakery", "industry": "Food and Bakery", "img": "img1.png"},
    {"name": "PreshyYours", "industry": "Beauty and Makeup", "img": "img1.png"},
    {"name": "Discord", "industry": "Gaming", "img": "img1.png"},
    {"name": "Fiverr", "industry": "ICT and Computer", "img": "img1.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarText: "Search",
      body: ListView(
        cacheExtent: 100,
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
      ),
    );
  }
}
