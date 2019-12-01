import 'package:flutter/material.dart';
import 'package:kaf/widgets/TxtField.dart';

class SignUpTab extends StatefulWidget {
  @required VoidCallback onPressed;
  SignUpTab({this.onPressed});
  @override
  _SignUpTabState createState() => _SignUpTabState(onPressed: onPressed);
}

class _SignUpTabState extends State<SignUpTab> {
  @required VoidCallback onPressed;
  int _index = 2;
  _SignUpTabState({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width - 20,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: onPressed,
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 20) / 2,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 207, 90, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0))),
                    child: Center(
                        child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromRGBO(35, 49, 66, 1),
                      ),
                    )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: (MediaQuery.of(context).size.width - 20) / 2 + 20,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: Center(
                      child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 27,
                      color: Color.fromRGBO(202, 75, 75, 1),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Container(
            height: MediaQuery.of(context).size.height*0.87,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height*0.08,
                        child: Image.asset("assets/Logo.png"),
                      )),
                  new Text("Kaf",
                      style: TextStyle(color:Theme.of(context).primaryColor, fontSize: 40)),
                  TxtFeild(
                      txt: "Full name",
                      icon: Icon(Icons.person),
                      obscure: false),
                  TxtFeild(
                      txt: "Username",
                      icon: Icon(Icons.person),
                      obscure: false),
                  TxtFeild(
                      txt: "Email", icon: Icon(Icons.email), obscure: false),
                  TxtFeild(
                      txt: "Password", icon: Icon(Icons.lock), obscure: true),
                  TxtFeild(
                      txt: "Phone", icon: Icon(Icons.phone), obscure: false),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: SizedBox(
                            width: 135,
                            height: 50,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.pushNamed(context,"/LocationSet");
                              },
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Text("Sign up",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}