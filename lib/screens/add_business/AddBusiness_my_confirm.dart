import 'package:flutter/material.dart';
import 'package:ugrr/Session.dart';
import 'package:ugrr/colors.dart';
import 'package:ugrr/myColors.dart';
import 'package:ugrr/widgets/Btn1.dart';
import 'package:ugrr/widgets/Container1.dart';
import 'package:ugrr/widgets/HeadingText1.dart';
import 'package:ugrr/widgets/HeadingText2.dart';
import 'package:ugrr/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBusiness_my_confirm extends StatefulWidget {
  const AddBusiness_my_confirm({Key key}) : super(key: key);

  @override
  State<AddBusiness_my_confirm> createState() => _AddBusiness_my_confirmState();
}

class _AddBusiness_my_confirmState extends State<AddBusiness_my_confirm> {
  bool hasBuilt = false;
  var _name, _industry, _phone, _address, _accName, _accNumber;
  @override
  void initState() {
    var name, industry, phone, address, accName, accNumber;
    () async {
      SharedPreferences p = await SharedPreferences.getInstance();
      name = p.getString("addBusinessName").toString() == 'null'
          ? ''
          : p.get("addBusinessName").toString();
      ;
      industry = p.getString("addBusinessIndustry").toString() == 'null'
          ? ''
          : p.get("addBusinessIndustry").toString();
      phone = p.getString("addBusinessPhone").toString() == 'null'
          ? ''
          : p.get("addBusinessPhone").toString();
      address = p.getString("addBusinessAddress").toString() == 'null'
          ? ''
          : p.get("addBusinessAddress").toString();
      accName = p.getString("addBusinessAccName").toString() == 'null'
          ? ''
          : p.get("addBusinessAccName").toString();
      accNumber = p.getString("addBusinessAccNumber").toString() == 'null'
          ? ''
          : p.get("addBusinessAccNumber").toString();
    }()
        .then((value) => setState(() {
              _name = name;
              _industry = industry;
              _phone = phone;
              _address = address;
              _accName = accName;
              _accNumber = accNumber;
              hasBuilt = true;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_box, size: 100, color: accentColor),
              SizedBox(
                height: 40,
              ),
              HeadingText1(
                text: "Confirm!",
                size: 20,
              ),
              SizedBox(
                height: 30,
              ),
              hasBuilt
                  ? Container1(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _name != ''
                              ? Row(
                                  children: [
                                    HeadingText1(text: "Business Name:  "),
                                    HeadingText2(
                                      text: _name,
                                      size: 15,
                                    )
                                  ],
                                )
                              : SizedBox(),
                          _industry != ''
                              ? Row(
                                  children: [
                                    HeadingText1(text: "Business Industry:  "),
                                    HeadingText2(
                                      text: _industry,
                                      size: 15,
                                    )
                                  ],
                                )
                              : SizedBox(),
                          _phone != ''
                              ? Row(
                                  children: [
                                    HeadingText1(
                                        text: "Business Phone Number:  "),
                                    HeadingText2(
                                      text: _phone,
                                      size: 15,
                                    )
                                  ],
                                )
                              : SizedBox(),
                          _address != ''
                              ? Row(
                                  children: [
                                    HeadingText1(text: "Business Address:  "),
                                    HeadingText2(
                                      text: _address,
                                      size: 15,
                                    )
                                  ],
                                )
                              : SizedBox(),
                          _accName.trim() != ''
                              ? Row(
                                  children: [
                                    HeadingText1(
                                        text: "Business Account Name:  "),
                                    HeadingText2(
                                      text: _accName,
                                      size: 15,
                                    )
                                  ],
                                )
                              : SizedBox(),
                          _accNumber.trim() != ''
                              ? Row(
                                  children: [
                                    HeadingText1(
                                        text: "Business Account Number:  "),
                                    HeadingText2(
                                      text: _accNumber,
                                      size: 15,
                                    )
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Btn1.viewWidth - 20,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Btn1(
                        text: "back",
                        onClick: () => Navigator.pop(context, false),
                        bgc: bgColor,
                        color: accentColor,
                      ),
                      flex: 5,
                    ),
                    Expanded(
                      child: Btn1(
                          text: "done",
                          onClick: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RouteManager.homePage, (route) => false);
                            Navigator.pushNamed(
                                context, RouteManager.dashboard);
                          },
                          withIcon: true,
                          icon: Icons.check),
                      flex: 5,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
