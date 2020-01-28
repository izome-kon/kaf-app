import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:kaf/Contents/BottomNavyBar.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/widgets/cards_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final String search;
  final String resultCounter;
  final RecentCards resultCard;
  bool filtring;
  var _selectedIndex = 0;
  int grouped;
  PageController _pageController;
  _SearchResultState(
      {this.search = "Heart",
      this.resultCard,
      this.resultCounter = "200",
      this.filtring = false,
      this.grouped=0
      });

  filterButtonClicked() {
    
    setState(() {
      if (filtring)
        filtring = false;
      else
        filtring = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: PreferredSize(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Theme.of(context).primaryColor),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset("assets/Look@2x.png"),
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
                  Text(
                    search,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(60),
          ),
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text("$resultCounter +"+AppLocalizations.of(context).results,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ))
                      ],
                    ),
                  ),
                 // RecentCards(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: filterButtonClicked,
                      child: Icon(
                        MdiIcons.filterOutline,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.88),
                    )),
              ),
            ],
          ),
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
          floatingActionButton: FloatingActionButton(
            heroTag: "btn3",
            onPressed: () {},
            child: Icon(
              Icons.search,
              size: 40,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
        filtringPage(),
      ],
    );
  }



  Container filtringPage() {
    return Container(
      width: filtring ? MediaQuery.of(context).size.width : 0,
      height: filtring ? MediaQuery.of(context).size.height : 0,
      child: BackdropFilter(
        filter: prefix0.ImageFilter.blur(
          sigmaX: 7,
          sigmaY: 7,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Material(
            color: Colors.white.withOpacity(0),
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                                  child: Column(
                    
                    children: <Widget>[
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).filter,
                                style:
                                    TextStyle(fontSize: 35, color: Colors.white),
                              ),
                              InkWell(
                                child: Text(
                                  AppLocalizations.of(context).clearFilter,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                      children: <Widget>[
                        Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("   "+AppLocalizations.of(context).sortedBy,style: TextStyle(color: Colors.black45),),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).lowestPrice),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).closestToYou),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("   "+AppLocalizations.of(context).availability,style: TextStyle(color: Colors.black45),),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){
                                  setState(() {
                                    grouped=T;
                                  });
                                },value: 1,groupValue: grouped,),
                                Text(AppLocalizations.of(context).availableAnyDay),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 2,groupValue: grouped,),
                                Text(AppLocalizations.of(context).availableToday),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).availableInNext3Days),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).availableComingWeekend),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("   "+AppLocalizations.of(context).price,style: TextStyle(color: Colors.black45),),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).free),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text("1-200"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text("201-500"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text("500-1000"),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      ),
                      Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("   "+AppLocalizations.of(context).gender,style: TextStyle(color: Colors.black45),),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).male),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(onChanged: (T){},value: 1,groupValue: 0,),
                                Text(AppLocalizations.of(context).female),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      SafeArea(child: Container(),minimum: EdgeInsets.all(15),)
                      ],
                      )
                      
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: "btn4",
                          onPressed: () {},
                          child: Icon(MdiIcons.markerCheck),
                        ),
                        FloatingActionButton(
                          heroTag: "btn5",
                          backgroundColor: Colors.white,
                          onPressed: filterButtonClicked,
                          child: Icon(
                            MdiIcons.cancel,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
