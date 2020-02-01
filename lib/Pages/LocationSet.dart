import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';

class LocationSet extends StatefulWidget {
  @override
  _LocationSetState createState() => _LocationSetState();
}

class _LocationSetState extends State<LocationSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Image.asset(
        "assets/BGLogInState@2x.png",
        fit: BoxFit.cover,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "assets/Location.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(" "+AppLocalizations.of(context).selectYour+" "),
                          Text(
                            AppLocalizations.of(context).location,
                            style: TextStyle(color: Theme.of(context).accentColor),
                          ),
                          Text(AppLocalizations.of(context).toHelpFindTheNearest),
                        ],
                      ),
                      Text(AppLocalizations.of(context).serviceForYou)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: FlatButton(
                    splashColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pushNamed(context, "/Set_location_2");
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Theme.of(context).accentColor
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " "+AppLocalizations.of(context).setLocation+" ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: FlatButton(
                    splashColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pushNamed(context, "/ActivePhone");
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Theme.of(context).primaryColor
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).skip,
                            style: TextStyle(color: Colors.white),
                          ),
                           Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]
        )
    );
  }
}
