import 'package:flutter/material.dart';
import 'package:kaf/Contents/BottomNavyBar.dart';
import 'package:kaf/Contents/myAppBar.dart';
import 'package:kaf/Pages/SearchAll.dart';
import 'package:kaf/Pages/Support.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/widgets/Drawer_Button.dart';
import 'package:kaf/widgets/cards_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  bool searchclick;
  SearchAll search;
  _HomePageState({this.searchclick = false});
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    this.search = SearchAll("Search For All");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HomeAppBar(),
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/DrawerBG.png",
                    height: MediaQuery.of(context).size.height - 32,
                    width: double.infinity,
                  ),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
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
                                    borderSide: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {},
                                    child: Text(
                                     AppLocalizations.of(context).completYourProfile,
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).copyRight,
                  style: TextStyle(color: Colors.white54),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).bestDeals,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ))
                      ],
                    ),
                  ),
                  RecentCards(),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).bestOffers,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ))
                      ],
                    ),
                  ),
                  RecentCards(),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).know,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ))
                      ],
                    ),
                  ),
                  RecentCards(),
                ],
              ),
              Support(),
            ],
            onPageChanged: (T) {
              setState(() {
                _selectedIndex = T;
              });
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (searchclick) search,
            ],
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
        heroTag: "btn1",
        onPressed: () {
          setState(() {
            if (!searchclick)
              searchclick = true;
            else
              searchclick = false;
          });
        },
        child: Icon(
          searchclick ? Icons.close : Icons.search,
          size: 40,
        ),
        backgroundColor: searchclick
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
