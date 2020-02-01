import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:kaf/Contents/BottomNavyBar.dart';
import 'package:kaf/models/post_model.dart';
import 'package:kaf/models/user_model.dart';
import 'package:kaf/sql/sqlHelper.dart';
import 'package:kaf/widgets/BloodButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

//import 'package:permission_handler/permission_handler.dart';

import '../localizations.dart';

class AddYourNeed extends StatefulWidget {
  @override
  _AddYourNeedState createState() => _AddYourNeedState();
}

class _AddYourNeedState extends State<AddYourNeed> {
  final TextEditingController control = new TextEditingController();
  var _selectedIndex = 3;
  PageController _pageController = new PageController(initialPage: 3);

  bool rouleValue;
  File  image;
  @override
  void initState() {
    
    rouleValue = false;
    super.initState();
  }

  Future getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
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
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
                    padding: const EdgeInsets.only(top: 5.0, bottom: 50),
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
                                onPressed: getImage,
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
                                    Text(
                                        AppLocalizations.of(context)
                                            .addLocation,
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
                              GenderSelection(
                                maleText: "Male",
                                femaleText: "Female",
                                femaleImage:
                                    AssetImage('assets/woman (2)@2x.png'),
                                maleImage: AssetImage('assets/man (5)@2x.png'),
                                selectedGenderIconBackgroundColor:
                                    Theme.of(context).primaryColor,
                                checkIconAlignment: Alignment.bottomRight,
                                onChanged: (Gender gender) {
                                  print(gender);
                                },
                                equallyAligned: true,
                                animationDuration: Duration(milliseconds: 400),
                                isCircular: true, // default : true,
                                isSelectedGenderIconCircular: true,
                                opacityOfGradient: 0.1,
                                linearGradient: LinearGradient(colors: [
                                  Theme.of(context).accentColor,
                                  Theme.of(context).accentColor
                                ]),
                                padding: const EdgeInsets.all(3),
                                size: 80, //default : 120
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                      AppLocalizations.of(context).selectBlood),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    BloodButton("A+"),
                                    BloodButton("A-"),
                                    BloodButton("B+"),
                                    BloodButton("B-"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    BloodButton("O+"),
                                    BloodButton("O-"),
                                    BloodButton("AB+"),
                                    BloodButton("AB-"),
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (T) {
                                      setState(() {
                                        rouleValue = !rouleValue;
                                      });
                                    },
                                    value: rouleValue,
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String imgPath = await SqlHelper().uploadImage(image,"posts");
          SqlHelper().addNeed(
            PostModel(User(id: '1'), control.text, imgPath, '', 'Saudi Arabia')
           );
        },
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
          Navigator.pop(context);
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

}
