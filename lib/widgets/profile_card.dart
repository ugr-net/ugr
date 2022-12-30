import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugrr/screens/HomeScreen.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String userToken = "";

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userToken = prefs.getString('stringValue').toString();
    print("selectedType : $userToken");
    return userToken;
  }

  addStringToNullClear(String languageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', languageDataVale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 182, 149, 2),
          ),
        ),
        leading: IconButton(
          color: Color.fromARGB(255, 182, 149, 2),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                setState(() {
                  userToken = "";
                  // ignore: unnecessary_brace_in_string_interps
                  print("userToken logout: ${userToken}");
                  addStringToNullClear("");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                });
              },
              child: Text(
                "LogOut",
                style: TextStyle(
                  color: Color.fromARGB(255, 182, 149, 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
