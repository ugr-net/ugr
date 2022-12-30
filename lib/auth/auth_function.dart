import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugrr/screens/HomeScreen.dart';

class AuthClass {
  static addStringToSF(String languageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', languageDataVale);
  }

  static Future register(
      BuildContext context, String name, email, password) async {
    Map data = {
      'name': name,
      'email': email,
      'password': password,
    };
    print("All data: ${data}");

    String body = json.encode(data);
    var url = 'https://ugrr.net/mobile/api/register.php';
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );
    var result = jsonDecode(response.body);

    print("result: ${result}");
    print("response.body: ${response.body}");
    print("response.body: ${response.statusCode}");
    if (result['status'] == 201) {
      //Or put here your next screen using Navigator.push() method
      print('registeration successfully!');
      login(context, email, password);
      Fluttertoast.showToast(msg: result['message'].toString());
    } else {
      print('registeration have error');
      Fluttertoast.showToast(
        msg: result['message'].toString(),
        textColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 182, 149, 2),
      );
    }
  }

  static Future login(BuildContext context, String email, password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    print("All data: ${data}");

    String body = json.encode(data);
    var url = 'https://ugrr.net/mobile/api/login.php';
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );
    var result = jsonDecode(response.body);
    addStringToSF(result['token'].toString());
    print("result: ${result}");
    print("response.body: ${response.body}");
    print("response.body: ${response.statusCode}");
    if (result['status'] == 201) {
      print('login successfully!');
    } else {
      print('login have error');
      if (result['message'] == "You have successfully logged in.") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      }
      Fluttertoast.showToast(
        msg: result['message'].toString(),
        textColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 182, 149, 2),
      );
    }
  }
}
