import 'package:flutter/material.dart';
import 'package:ugrr/screens/GeneratedQRScreen.dart';
import 'package:ugrr/screens/HomeScreen.dart';
import 'package:ugrr/screens/GenerateQR.dart';
import 'package:ugrr/screens/ManageListingsScreen.dart';
import 'package:ugrr/screens/DashboardScreen.dart';
import 'package:ugrr/screens/SearchListScreen.dart';
import 'package:ugrr/screens/ViewBusiness.dart';
import 'package:ugrr/screens/add_business/AddBusiness.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_accBVN.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_accBank.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_accName.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_accNumber.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_address.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_bank.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_industry.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_phone.dart';
import 'package:ugrr/screens/add_business/AddBusiness_my_social.dart';
import 'package:ugrr/screens/add_business/AddBusiness_fb.dart';
import 'package:ugrr/screens/advanced_search_screen.dart';
import 'package:ugrr/screens/support_screen.dart';

import '../screens/add_business/AddBusiness_ig.dart';
import '../screens/add_business/AddBusiness_my_confirm.dart';
import '../screens/add_business/AddBusiness_tw.dart';
import '../screens/add_business/AddBusiness_yt.dart';
import 'CustomPageRoute.dart';

class RouteManager {
  static const String homePage = '/homepage';
  static const String generateQRCode = '/generateQRCode';
  static const String dashboard = '/dashboard';
  static const String manage_listings = '/manageListings';
  static const String addBusiness = '/addBusiness';
  static const String search = '/search';
  static const String addBusiness_my = '/addBusiness/my/name';
  static const String addBusiness_my_industry =
      '/dashboard/addBusiness/my/industry';

  static const String addBusiness_my_phone = '/dashboard/addBusiness/my/phone';
  static const String addBusiness_my_address =
      '/dashboard/addBusiness/my/address';
  static const String addBusiness_my_fb = '/dashboard/addBusiness/my/fb';
  static const String addBusiness_my_tw = '/dashboard/addBusiness/my/tw';
  static const String addBusiness_my_yt = '/dashboard/addBusiness/my/yt';
  static const String addBusiness_my_ig = '/dashboard/addBusiness/my/ig';
  static const String addBusiness_my_accName =
      '/dashboard/addBusiness/my/accName';
  static const String addBusiness_my_accNumber =
      '/dashboard/addBusiness/my/accNumber';
  static const String addBusiness_my_accBVN =
      '/dashboard/addBusiness/my/accBVN';
  static const String addBusiness_my_accBank =
      '/dashboard/addBusiness/my/accBank';

  static const String addBusiness_my_social =
      '/dashboard/addBusiness/my/social';
  static const String addBusiness_my_bank = '/dashboard/addBusiness/my/bank';
  static const String viewBusiness = '/viewBusiness';
  static const String addBusiness_my_confirm =
      '/dashboard/addBusiness/my/confirm';

  static const String generatedQRScreen = '/generateQRScreen';
  static const String advancedSearch = '/advancedSearch';
  static const String supportScreen = '/supportScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => Homepage());
      case generateQRCode:
        return MaterialPageRoute(builder: (context) => GenerateQRScreen());
      case dashboard:
        return MaterialPageRoute(builder: (context) => ProfileHome());
      case manage_listings:
        return MaterialPageRoute(builder: (context) => ManageListings());
      case addBusiness:
        return MaterialPageRoute(builder: (context) => AddBusiness());
      case addBusiness_my:
        return CustomPageRoute(
          child: AddBusiness_my(),
        );
      case addBusiness_my_industry:
        return CustomPageRoute(child: AddBusiness_my_industry());
      case addBusiness_my_phone:
        return CustomPageRoute(child: AddBusiness_my_phone());
      case addBusiness_my_address:
        return CustomPageRoute(child: AddBusiness_my_address());
      case addBusiness_my_fb:
        return CustomPageRoute(child: AddBusiness_my_fb());
      case addBusiness_my_yt:
        return CustomPageRoute(child: AddBusiness_my_yt());
      case addBusiness_my_tw:
        return CustomPageRoute(child: AddBusiness_my_tw());
      case addBusiness_my_ig:
        return CustomPageRoute(child: AddBusiness_my_ig());
      case addBusiness_my_social:
        return CustomPageRoute(child: AddBusiness_my_social());
      case addBusiness_my_bank:
        return CustomPageRoute(child: AddBusiness_my_bank());
      case addBusiness_my_accName:
        return CustomPageRoute(child: AddBusiness_my_accName());
      case addBusiness_my_accNumber:
        return CustomPageRoute(child: AddBusiness_my_accNumber());
      case addBusiness_my_accBVN:
        return CustomPageRoute(child: AddBusiness_my_accBVN());
      case addBusiness_my_accBank:
        return CustomPageRoute(child: AddBusiness_my_accBank());
      case addBusiness_my_confirm:
        return CustomPageRoute(child: AddBusiness_my_confirm());
      case search:
        return MaterialPageRoute(builder: (context) => SearchList());
      case viewBusiness:
        return CustomPageRoute(child: ViewBusiness());
      case generatedQRScreen:
        return CustomPageRoute(child: GeneratedQRScreen());
      case supportScreen:
        return CustomPageRoute(child: SupportScreen());
      case advancedSearch:
        return CustomPageRoute(child: AdvancedSearchScreen());
      default:
        return MaterialPageRoute(builder: (context) => Homepage());
    }
  }
}
