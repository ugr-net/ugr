import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static var data = {};
  // static add(String key, String value) async {
  //   data[key] = value;
  // }

  // static get(String key) async {
  //   SharedPreferences p = await SharedPreferences.getInstance();
  //   print(p.get(key).toString() + " from session");
  // }

  static remove(String key) async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.remove(key);
  }

  static add(key, value) async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString(key, value.toString());
    data[key] = p.get(key).toString();
  }
}
