import 'package:kaf/localizations.dart';
import 'package:kaf/widgets/LoginCards.dart';
import 'package:kaf/widgets/Logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LogInState extends StatefulWidget {
  @override
  _LogInStateState createState() => _LogInStateState();
}

Image getImage(String path) {
  return new Image.asset(
    path,
    fit: BoxFit.cover,
  );
}

class _LogInStateState extends State<LogInState> {
  double logosize ;
  double wordW = 200;
  double wordH = 60;
  Widget cardswitcher;
  
  @override
  Widget build(BuildContext context) {
    logosize= MediaQuery.of(context).size.width*0.4;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color:Theme.of(context).primaryColor,
            ),
            Image.asset("assets/BGLogInState@2x.png"),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Logo(logosize:logosize,),
                      new Text(AppLocalizations.of(context).title,
              style: TextStyle(color: Colors.white, fontSize: 60)),
                    ],
                  ),
                  AnimatedSwitcher(
                      
                      duration: Duration(seconds: 0),
                      child: LoginCards(),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
  

 
}
