import 'package:flutter/material.dart';
import 'package:kaf/Contents/BottomNavyBar.dart';

import '../localizations.dart';

class AddYourNeed extends StatefulWidget {
  @override
  _AddYourNeedState createState() => _AddYourNeedState();
}

class _AddYourNeedState extends State<AddYourNeed> {
  final TextEditingController control = new TextEditingController();
  var _selectedIndex = 3;
  PageController _pageController = new PageController(initialPage: 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          AppLocalizations.of(context).addYourNeed,
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          color: Theme.of(context).primaryColor,
        ),
        preferredSize: Size.fromHeight(48),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/BGLogInState@2x.png",
                fit: BoxFit.cover,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          child: Image.asset("assets/comment.png"),
                        ),
                        Text("Mahmoud Mohamed",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20)),
                        Text("+966015505886"),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: new TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor),
                              ),
                              labelText:
                                  AppLocalizations.of(context).writeYourNeed,
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.white),
                          style: new TextStyle(color: Colors.black),
                          controller: control,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              elevation: 0,
                              onPressed: () {},
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.camera_enhance,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(AppLocalizations.of(context).addPhoto,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor))
                                ],
                              )),
                          RaisedButton(
                              elevation: 0,
                              onPressed: () {},
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: Theme.of(context).primaryColor),
                                  Text(AppLocalizations.of(context).addLocation,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor))
                                ],
                              ))
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).gender,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  "assets/Male@2x.png",
                                  width: 70,
                                  height: 70,
                                ),
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.black26,
                                ),
                                Image.asset(
                                  "assets/Female@2x.png",
                                  width: 70,
                                  height: 70,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(AppLocalizations.of(context).selectBlood),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  blood("A+"),
                                  blood("A-"),
                                  blood("B+"),
                                  blood("B-"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  blood("O+"),
                                  blood("O-"),
                                  blood("AB+"),
                                  blood("AB-"),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  onChanged: (T) {},
                                  value: true,
                                ),
                                Container(
                                  child: Text(AppLocalizations.of(context)
                                      .doYouWantToMake),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation

        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),

        items: [
          BottomNavyBarItem(
            selectedIcon: Image.asset(
              "assets/Home selected.png",
              width: 25,
            ),
            icon: Image.asset(
              "assets/Home.png",
              width: 25,
            ),
            title: Text(AppLocalizations.of(context).home),
            inactiveColor: Colors.black54,
            activeColor: Theme.of(context).accentColor,
          ),
          BottomNavyBarItem(
              selectedIcon: Image.asset(
                "assets/wandLightSelected@2x.png",
                width: 25,
              ),
              icon: Image.asset("assets/wandLight.png", width: 25),
              title: Text(AppLocalizations.of(context).offers),
              inactiveColor: Colors.black54,
              activeColor: Theme.of(context).accentColor),
          BottomNavyBarItem(
              selectedIcon: Image.asset(
                "assets/knowledgeSelected.png",
                width: 20,
              ),
              icon: Image.asset("assets/knowledge.png", width: 20),
              title: Text(
                AppLocalizations.of(context).know,
              ),
              inactiveColor: Colors.black54,
              activeColor: Theme.of(context).accentColor),
          BottomNavyBarItem(
              selectedIcon: Image.asset("assets/suportSelected.png", width: 25),
              icon: Image.asset("assets/support.png", width: 25),
              title: Text(AppLocalizations.of(context).support),
              inactiveColor: Colors.black54,
              activeColor: Theme.of(context).accentColor),
        ],
      ),
    );
  }

  blood(String blood) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2, color: Theme.of(context).primaryColor)),
      child: CircleAvatar(
        child: Text(
          blood,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
