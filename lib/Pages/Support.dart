import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.95),
      child: Column(
        children: <Widget>[
          Image.asset("assets/supportBG.png"),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 250,
                  width: 155,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/LookForDonation");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:80,bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset("assets/Group 2303@2x.png",width: 100,),
                          Row(
                            children: <Widget>[
                              Text(AppLocalizations.of(context).lookForDonation,style: TextStyle(color: Colors.white),),
                            ],
                          )
                        ],
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 250,
                  width: 155,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/AddyourNeed");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:80,bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset("assets/Group 2302@2x.png",width: 100,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppLocalizations.of(context).benefactor,style: TextStyle(color: Colors.white),),
                            ],
                          )
                        ],
                      ),
                    ),
                    color: Theme.of(context).accentColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.94,
                alignment: Alignment.center,
                decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(15)) ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).theHoly,style: TextStyle(),),
                    Text(AppLocalizations.of(context).says,style: TextStyle(color: Colors.red),),
                    Text(AppLocalizations.of(context).theBestPerson),
                    Text(AppLocalizations.of(context).humanBegin)
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
