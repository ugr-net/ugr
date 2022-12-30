import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/Dropdown1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/Input1.dart';
import 'package:ugrr/widgets/MyScaffold.dart';

class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({Key key}) : super(key: key);

  static const industries = const [
    "Food",
    "ICT and computer",
    "social media management",
    "gaming"
  ];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarText: "Advanced Search",
      body: ListView(
        children: [
          SizedBox(
            height: Btn1.viewHeight / 6,
          ),
          Icon(
            Icons.search_rounded,
            size: 120,
            color: accentColor,
          ),
          Container(
            alignment: Alignment.center,
            child: HeadingText1(
              text: "Search with more precise information",
            ),
          ),
          SizedBox(height: 20),
          Input1(
            autofocus: true,
            icon: FontAwesomeIcons.magnifyingGlass,
            placeholder: "Business name or keyword",
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 10),
          Dropdown1(
            array: industries,
            placeholder: "Business Industry...",
          ),
          SizedBox(height: 10),
          Dropdown1(
            array: industries,
            placeholder: "Business what again...",
          ),
        ],
      ),
    );
  }
}
