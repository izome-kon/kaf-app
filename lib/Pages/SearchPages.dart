import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
  Widget containe(String search,String label,BuildContext context)
  {
    final TextEditingController control = new TextEditingController();
    return SingleChildScrollView(
      
          child: Center(
        child: new Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.45,
            decoration: new BoxDecoration(color: Color.fromRGBO(50, 87, 167, 1),
                borderRadius: new BorderRadius.only(topLeft: Radius.circular(60.0),topRight: Radius.circular(60.0) )
            ),
            child : Stack(
              fit:StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset("assets/DrawerBG.png",fit: BoxFit.cover),
                Center(
                  child: new Stack(children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(search,style: TextStyle(color: Colors.white,fontSize: 35),),
                        Container(
                          width: 450,
                          child: new TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                hintText: label,
                                filled: true,
                                fillColor: Colors.white),
                            style: new TextStyle(color: Colors.black),
                            controller: control,),
                        ),
                        Container(
                          width: 150,
                          child: new RaisedButton(onPressed:(){
                            Navigator.pushNamed(context, "/SearchResult");
                          },
                              color: Color.fromRGBO(250, 207, 90, 1),
                              child: new Text(AppLocalizations.of(context).search,style: TextStyle(color: Colors.black,fontSize: 15),),
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                        ),

                      ],
                    ),

                  ]
                  ),
                ),
              ],
            )),
      ),
    );
  }

