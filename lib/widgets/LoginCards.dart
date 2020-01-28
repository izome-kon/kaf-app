import 'package:flutter/material.dart';
import 'package:kaf/Pages/login_signin.dart' as def;
import 'package:kaf/localizations.dart';

class LoginCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: MediaQuery.of(context).size.width,
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: new Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: new Container(
                  height: 290,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: new Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0))),
                    child: LogInComponents(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LogInComponents(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(AppLocalizations.of(context).loginWith,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 300,
            height: 40,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: Color.fromRGBO(201, 71, 71, 1),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => def.log_sign(1)),
              ),
              child: Text(AppLocalizations.of(context).yourEmail,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 300,
            height: 40,
            child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
                color: Color.fromRGBO(42, 93, 154, 1),
                onPressed: () {},
                child: Text("FACEBOOK",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(AppLocalizations.of(context).areYouNew,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => def.log_sign(2)),
                  );
                },
                child: Text(AppLocalizations.of(context).startHere,
                    style: TextStyle(
                        fontSize: 17.0, color: Color.fromRGBO(201, 71, 71, 1))),
              )
            ],
          ),
        )
      ],
    );
  }
}
