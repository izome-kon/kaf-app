import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kaf/Pages/SearchResult.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/sql/sqlHelper.dart';
  Widget containe(String search,String label,BuildContext context)
  {
     TextEditingController control = new TextEditingController();
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
                          width: MediaQuery.of(context).size.width*0.9,
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
                          Future<List<dynamic>> resList = SqlHelper().search(control.text);
                          
                          Navigator.push(context,  MaterialPageRoute(
                          builder: (context) => SearchResult(keyWord:control.text,resultList: resList,)
                          )
                          );
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

