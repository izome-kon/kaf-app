import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaf/Pages/ActivePhone.dart';
import 'package:kaf/Pages/AddyourNeed.dart';
import 'package:kaf/Pages/Clinic_info.dart';
import 'package:kaf/Pages/Doctor_info.dart';
import 'package:kaf/Pages/Help.dart';
import 'package:kaf/Pages/LoadPage.dart';
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
import 'package:kaf/localizations.dart';
import 'package:kaf/widgets/AppDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(WelcomePage());

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Neo_Sans_Arabic",
        primaryColor: Color.fromRGBO(50, 87, 167, 1),
        accentColor: Color.fromRGBO(219, 64, 78, 1),
        highlightColor: Color.fromRGBO(250, 207, 90, 1),
      ),
      home: LoadPage(),
    );
  }
}

class App extends StatefulWidget {
  String language;
  var home;
  App(this.language, this.home);
  static String getAppLanguage() {
    return _AppState.appLanguage;
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool load;
  static String appLanguage;
  SprcificLocalizationDelegate _sprcificLocalizationDelegate;

  @override
  void initState() {
    appLanguage = widget.language;
    _sprcificLocalizationDelegate =
        SprcificLocalizationDelegate(new Locale(appLanguage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        "/Home": (BuildContext context) => new HomePage(),
        "/ActivePhone": (BuildContext context) => new ActivePhone(),
        "/AddyourNeed": (BuildContext context) => new AddYourNeed(),
        "/Clinic_info": (BuildContext context) => new ClinicInfo(),
        "/Doctor_info": (BuildContext context) => new DoctorInfo(),
        "/Help": (BuildContext context) => new HelpUser(),
        "/LocationSet": (BuildContext context) => new LocationSet(),
        "/login_signin": (BuildContext context) => new LogSign(1),
        "/login": (BuildContext context) => new LogInState(),
        "/LookForDonation": (BuildContext context) => new LookForDonation(),
        "/Offer_details_2": (BuildContext context) => new OfferDetails2(),
        "/Offer_Details": (BuildContext context) => new OfferDetails(),
        "/SearchResult": (BuildContext context) => new SearchResult(),
        "/Set_location_2": (BuildContext context) => new SetLocation(),
        "/Support": (BuildContext context) => new Support(),
      },
      home: widget.home,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Neo_Sans_Arabic",
        primaryColor: Color.fromRGBO(50, 87, 167, 1),
        accentColor: Color.fromRGBO(219, 64, 78, 1),
        highlightColor: Color.fromRGBO(250, 207, 90, 1),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _sprcificLocalizationDelegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: _sprcificLocalizationDelegate.overriddenLocale,
    );
  }
}
