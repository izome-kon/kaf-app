import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:kaf/Pages/HomePage.dart';
import 'package:kaf/Pages/login.dart';
import 'package:kaf/main.dart';
import 'package:kaf/widgets/Logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var home;
  Future languageSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language');
    String token = prefs.getString('token');
    if (lang == null) prefs.setString('language', 'en');
    if (token == null)
      home = LogInState();
    else
      home = HomePage();
    Timer(new Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => App(lang, home)),
      );
    });
  }

  @override
  void initState() {
    languageSetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/DrawerBG.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
                child: Logo(
              logosize: 200,
            )),
            Center(
              child: SpinKitPulse(
                color: Colors.white,
                size: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
