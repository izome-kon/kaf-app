import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
class ActivePhone extends StatefulWidget {
  @override
  _ActivePhoneState createState() => _ActivePhoneState();
}

class _ActivePhoneState extends State<ActivePhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      child: Image.asset(
                        "assets/verification.png",
                        width: 130,
                        height: 130,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context).enterCode,
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "* * * * * *",
                      style: TextStyle(
                          color: Color.fromRGBO(39, 174, 96, 10), fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60),
                    child: Text(
                      AppLocalizations.of(context).weHaveSent,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          PinInputTextField(
                          pinLength: 6,
                          autoFocus: false,

                          decoration: UnderlineDecoration(
                            color: Theme.of(context).accentColor,
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 30
                            )
                          ),
                        ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 30),
                              child: FlatButton(
                                splashColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/Home");
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(40)),
                                        color: Theme.of(context).primaryColor
                                        ),
                                    child: Text(
                                      AppLocalizations.of(context).submit,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(AppLocalizations.of(context).didNotReceiveTheCode),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                onTap: (){},
                                splashColor: Colors.black26,

                                child: Text(AppLocalizations.of(context).resent,style: TextStyle(
                                  color: Theme.of(context).accentColor
                                ),),
                              ),

                              InkWell(
                                onTap: (){},
                                splashColor: Colors.black26,

                                child: Text(AppLocalizations.of(context).getACallNow,style: TextStyle(
                                    color:Theme.of(context).accentColor
                                ),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
