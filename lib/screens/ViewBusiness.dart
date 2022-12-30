import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/Container1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/like_button.dart';

import '../colors.dart';
import '../widgets/Btn1.dart';
import '../widgets/HeadingText2.dart';
import '../widgets/MyScaffold.dart';

class ViewBusiness extends StatelessWidget {
  const ViewBusiness({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarText: "Business Overview",
      body: Container(
        padding: EdgeInsets.all(12),
        child: Flex(direction: Axis.vertical, children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 98,
                  margin: EdgeInsets.only(right: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: primaryColorO,
                  ),
                  child: Image.asset(
                    'assets/images/img1.png',
                    height: 98,
                    width: 98,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText1(
                      text: "Great Bakery",
                      size: 22,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    HeadingText2(text: "Food"),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color.fromARGB(64, 255, 255, 255),
            ),
          ),
          Expanded(
              child: ListView(
            cacheExtent: 2000,
            children: [
              SizedBox(height: 20),
              HeadingText2(text: "Like or Follow Us"),
              SizedBox(height: 10),
              Row(
                children: [
                  LikeButton(
                    color: MyColor.fbColor,
                    isLiked: true,
                    icon: Icons.facebook,
                    number: "1M",
                  ),
                  LikeButton(
                    color: MyColor.igColor,
                    isLiked: true,
                    icon: FontAwesomeIcons.instagram,
                    number: "2M",
                  ),
                  LikeButton(
                    color: MyColor.twColor,
                    isLiked: true,
                    icon: FontAwesomeIcons.twitter,
                    number: "1M",
                  ),
                  LikeButton(
                    color: MyColor.ytColor,
                    isLiked: true,
                    icon: FontAwesomeIcons.youtube,
                    number: "1M",
                  ),
                ],
              ),
              SizedBox(height: 20),
              ExpandableText(
                "Lorem ipsum dolor sit, amet consectetur adipisicing elit. A deserunt vero sit inventore delectus quod eligendi ipsa asperiores iure, sed labore, adipisci eum aut similique laudantium dignissimos ut provident, perspiciatis quam consectetur illo quasi enim ratione! Fuga, repellat distinctio. Ullam perferendis obcaecati in reprehenderit vel cumque minima aspernatur sunt sint possimus, eos placeat? Fugiat nostrum quo, ut, hic iure veritatis repellat delectus ab ea perspiciatis officiis tempora? Et optio, repellat, atque eius soluta fuga odio consequuntur animi repudiandae sint eum pariatur tenetur itaque saepe qui eaque. Saepe dolorem ipsa deleniti quasi sit eos sed necessitatibus accusamus impedit. Pariatur, minima repellendus.Lorem ipsum dolor sit, amet consectetur adipisicing elit. A deserunt vero sit inventore delectus quod eligendi ipsa asperiores iure, sed labore, adipisci eum aut similique laudantium dignissimos ut provident, perspiciatis quam consectetur illo quasi enim ratione! Fuga, repellat distinctio. Ullam perferendis obcaecati in reprehenderit vel cumque minima aspernatur sunt sint possimus, eos placeat? Fugiat nostrum quo, ut, hic iure veritatis repellat delectus ab ea perspiciatis officiis tempora? Et optio, repellat, atque eius soluta fuga odio consequuntur animi repudiandae sint eum pariatur tenetur itaque saepe qui eaque. Saepe dolorem ipsa deleniti quasi sit eos sed necessitatibus accusamus impedit. Pariatur, minima repellendus.",
                animation: true,
                expandText: "Read more",
                maxLines: 8,
                collapseText: "Show less",
                style: TextStyle(
                  color: primaryColorO,
                  fontSize: 16,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(height: 20),
            ],
          )),
        ]),
      ),
    );
  }
}
