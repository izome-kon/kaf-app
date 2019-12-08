import 'package:flutter/material.dart';
import 'package:kaf/Contents/BottomNavyBar.dart';
import 'package:kaf/Contents/myAppBar.dart';
import 'package:kaf/Pages/SearchAll.dart';
import 'package:kaf/Pages/Support.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/widgets/AppDrawer.dart';
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
      drawer:AppDrawer(), 
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
              
              if (searchclick)
              search,
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
