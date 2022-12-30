import 'package:flutter/material.dart';
import 'package:ugrr/Session.dart';
import 'package:ugrr/colors.dart';
// import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/widgets/IconText1.dart';
import 'package:ugrr/routes/routes.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:ugrr/widgets/barChart_bar.dart';
import 'package:ugrr/widgets/fade_in.dart';
import 'package:ugrr/widgets/profile_card.dart';

import '../widgets/Btn1.dart';
import '../widgets/Container1.dart';
import '../widgets/MyScaffold.dart';
import '../widgets/pie_chart.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({Key key}) : super(key: key);

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  Image profilePic;
  @override
  void initState() {
    () {
      Session.remove("addBusinessName");
      Session.remove("addBusinessIndustry");
      Session.remove("addBusinessPhone");
      Session.remove("addBusinessAddress");
      Session.remove("addBusinessFb");
      Session.remove("addBusinessIg");
      Session.remove("addBusinessTw");
      Session.remove("addBusinessYt");
      Session.remove("addBusinessAccName");
      Session.remove("addBusinessAccNumber");
      Session.remove("addBusinessAccBVN");
      Session.remove("addBusinessAccBank");
    }();
    super.initState();
    profilePic = Image.asset(
      'assets/images/img1.png',
      fit: BoxFit.cover,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(profilePic.image, context).then((value) => true);
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarText: "Dashboard",
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: ListView(
              cacheExtent: 12,
              children: [
                SizedBox(height: 20),
                ProfileCard(),
                SizedBox(height: 20),
                Container(
                  key: GlobalKey(),
                  alignment: Alignment.center,
                  child: FadeIn.top(
                    time: 1,
                    child: Container(
                        width: 130,
                        height: 130,
                        margin: EdgeInsets.only(bottom: 20),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: primaryColorO,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: profilePic),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    child: HeadingText1(text: 'John Doe')),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 12),
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
                  ),
                  child: Column(
                    children: [
                      IconText1('email', 'johndoe1234@gmail.com', Icons.mail),
                      SizedBox(
                        height: 10,
                      ),
                      IconText1(
                          'balance', '2000', Icons.account_balance_wallet),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  child: Btn1(
                    text: "Manage Listings",
                    icon: Icons.arrow_forward_rounded,
                    withIcon: true,
                    onClick: () {
                      Navigator.pushNamed(
                          context, RouteManager.manage_listings);
                    },
                  ),
                ),
                Container1(
                  height: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText2(
                        text: 'Social Media',
                        size: 15,
                      ),
                      PieChartSample3(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 65,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 15),
              child: Flex(direction: Axis.horizontal, children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Btn1(
                      text: "Shop",
                      onClick: () => Navigator.pushNamed(
                          context, RouteManager.generateQRCode),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Btn1(
                      text: "Support",
                      onClick: () => Navigator.pushNamed(
                          context, RouteManager.supportScreen),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
