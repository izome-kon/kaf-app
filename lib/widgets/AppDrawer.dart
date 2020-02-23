import 'package:flutter/material.dart';
import 'package:kaf/main.dart';
import 'package:kaf/models/user_model.dart';
import 'package:kaf/sql/sqlHelper.dart';
import 'package:kaf/Pages/EditProfile.dart';
import 'package:kaf/Pages/LoadPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localizations.dart';
import 'Drawer_Button.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  User user;
  bool finish;
  setUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');
    //print(token);
    if (token == null)
      Navigator.pushNamed(context, '/login');
    else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> userList = prefs.getStringList('userList');
      if (userList == null) {
        Map userMap = await SqlHelper.getUser(token);
        user = new User(
            id: userMap['id'].toString(),
            email: userMap['email'].toString(),
            name: userMap['name'],
            imageUrl: userMap['avatar']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setStringList('userList', user.getUserList());
        setState(() {
          finish = true;
        });
      } else {
        Map<int, String> userMap = userList.asMap();
        user = new User(
          id: userMap[0],
          name: userMap[1],
          imageUrl: userMap[2],
          birthdate: userMap[3],
          bloodType: userMap[4],
          email: userMap[5],
          gender: userMap[6],
          phone: userMap[7],
          type: userMap[8],
        );
        setState(() {
          finish = true;
        });
      }
    }
  }

  @override
  void initState() {
    finish = false;
    setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/DrawerBG.png",
              height: MediaQuery.of(context).size.height - 32,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white.withOpacity(0.05),
                      child: Column(
                        children: <Widget>[
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    MdiIcons.settingsOutline,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfile(user)),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    MdiIcons.close,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          ),
                          finish
                              ? Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        "assets/Logo.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text("+966 9712345667",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    SafeArea(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "22%",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                color: Colors.black45,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: 10,
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50))),
                                                  width: 75,
                                                ),
                                              ],
                                            ),
                                          ),
                                          OutlineButton(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0)),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfile(user)),
                                              );
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .completYourProfile,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                        ],
                      ),
                    ),
                    DrawerButton(
                      name: AppLocalizations.of(context).myOffers,
                      icon: MdiIcons.giftOutline,
                      onPressed: () {},
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.76,
                    ),
                    DrawerButton(
                      name: AppLocalizations.of(context).myDonations,
                      icon: MdiIcons.handHeart,
                      onPressed: () {},
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.76,
                    ),
                    DrawerButton(
                      name: AppLocalizations.of(context).myFavorite,
                      icon: MdiIcons.heartOutline,
                      onPressed: () {},
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.76,
                    ),
                    DrawerButton(
                      name: AppLocalizations.of(context).language,
                      icon: Icons.language,
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        if (App.getAppLanguage() == "en")
                          pref.setString('language', 'ar');
                        else
                          pref.setString('language', 'en');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoadPage()),
                        );
                      },
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.76,
                    ),
                    DrawerButton(
                      name: AppLocalizations.of(context).help,
                      icon: MdiIcons.helpCircleOutline,
                      onPressed: () {},
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.76,
                    ),
                    DrawerButton(
                      name: AppLocalizations.of(context).aboutKaf,
                      icon: MdiIcons.informationOutline,
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    AppLocalizations.of(context).copyRight,
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
