import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../localizations.dart';
import 'Drawer_Button.dart';

class AppDrawer extends StatelessWidget {
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    MdiIcons.settingsOutline,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
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
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/Logo.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            "Mahmoud Mohamed",
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
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  width: MediaQuery.of(context).size.width *
                                      0.8,
                                  height: 10,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
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
                                          new BorderRadius.circular(30.0)),
                                  onPressed: () {},
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .completYourProfile,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
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
                      onPressed: () {},
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
                  padding: const EdgeInsets.only(bottom:20.0),
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
