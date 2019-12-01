import 'package:flutter/material.dart';
import 'package:kaf/Pages/ActivePhone.dart';
import 'package:kaf/Pages/AddyourNeed.dart';
import 'package:kaf/Pages/Clinic_info.dart';
import 'package:kaf/Pages/Doctor_info.dart';
import 'package:kaf/Pages/Help.dart';
import 'package:kaf/Pages/HomePage.dart';
import 'package:kaf/Pages/LocationSet.dart';
import 'package:kaf/Pages/LookForDonation.dart';
import 'package:kaf/Pages/Offer_Details.dart';
import 'package:kaf/Pages/Offer_details_2.dart';
import 'package:kaf/Pages/SearchResult.dart';
import 'package:kaf/Pages/Set_location_2.dart';
import 'package:kaf/Pages/Support.dart';
import 'package:kaf/Pages/login.dart';
import 'package:kaf/Pages/login_signin.dart';

void main() => runApp(new MaterialApp(
  routes: <String,WidgetBuilder>{
    "/Home":(BuildContext context)=>new HomePage(),
    "/ActivePhone":(BuildContext context)=>new ActivePhone(),
    "/AddyourNeed":(BuildContext context)=>new AddYourNeed(),
    "/Clinic_info":(BuildContext context)=>new Clinic_info(),
    "/Doctor_info":(BuildContext context)=>new Doctor_info(),
    "/Help":(BuildContext context)=>new HelpUser(),
    "/LocationSet":(BuildContext context)=>new LocationSet(),
    "/login_signin":(BuildContext context)=>new log_sign(1),
    "/login":(BuildContext context)=>new LogInState(),
    "/LookForDonation":(BuildContext context)=>new LookForDonation(),
    "/Offer_details_2":(BuildContext context)=>new offer_details_2(),
    "/Offer_Details":(BuildContext context)=>new offer_details(),
    "/SearchResult":(BuildContext context)=>new SearchResult(),
    "/Set_location_2":(BuildContext context)=>new Set_location(),
    "/Support":(BuildContext context)=>new Support(),
  },
  home: LogInState(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Color.fromRGBO(50, 87, 167, 1),
    accentColor: Color.fromRGBO(219, 64, 78, 1),
    highlightColor: Color.fromRGBO(250, 207, 90, 1),
  ),
));