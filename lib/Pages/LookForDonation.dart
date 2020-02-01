import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kaf/Contents/BottomNavyBar.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/main.dart';
import 'package:kaf/models/post_model.dart';
import 'package:kaf/models/user_model.dart';
import 'package:kaf/sql/sqlHelper.dart';
import 'package:kaf/widgets/post.dart';

class LookForDonation extends StatefulWidget {
  @override
  _LookForDonationState createState() => _LookForDonationState();
}

class _LookForDonationState extends State<LookForDonation> {
    var _selectedIndex = 3;
    int _postsCounter;
    List test;
  PageController _pageController = new PageController(initialPage: 3);

  bool load;

  @override
  void initState() {
    load=false;
    fun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !load?Center(child: CircularProgressIndicator(),):
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            expandedHeight: 250,
            elevation: 20,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    "assets/BGLogInState@2x.png",
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _postsCounter.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                                Text(
                                  AppLocalizations.of(context).lookForDonation,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/AddyourNeed");
                              },
                              child: Text(
                                AppLocalizations.of(context).addYourNeed,
                                style: TextStyle(color: Theme.of(context).primaryColor),
                              ),
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              title: Text(AppLocalizations.of(context).lookForDonation),
              centerTitle: true,
            ),
          ),
          SliverPrototypeExtentList(
            prototypeItem: Post(
          postModel: PostModel(User(name: '?'), '?', "?", "? ", "?"),
        ),
            delegate: SliverChildListDelegate(
             children1        
            ),
          )
        ],
      ),
         floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.search,
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
  List<Widget> children1 ;
    Future <List> fun() async{
      await Jiffy.locale(App.getAppLanguage());
      return await SqlHelper().needs().then(
        (v){
         setState(() {
           _postsCounter = v.length;
           children1= children(v);
            load = true;
         });
        }
      ) ;
    }
     List<Widget> children(List data){
       List<Widget> posts = new List<Widget>();
       for (var item in data) {
         posts.add(Post(
          postModel: PostModel(User(name: item['user_id'].toString()), item['text'], item['image'], Jiffy(DateTime.parse(item['created_at'])).fromNow(), item['address']),
        ));
       }
       return posts;
     } 



 
}
