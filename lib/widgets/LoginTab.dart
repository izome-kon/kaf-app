import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaf/Pages/ForgetPassword.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/sql/sqlHelper.dart';
import 'package:kaf/widgets/Logo.dart';
import 'package:kaf/widgets/TxtField.dart';

class LoginTab extends StatefulWidget {
  @required
  final VoidCallback onPressed;
  LoginTab({this.onPressed});
  @override
  _LoginTabState createState() => _LoginTabState(onPressed: onPressed);
}

class _LoginTabState extends State<LoginTab> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool laod;

  wrongUser(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("تنبيه"),
              content: Text("يرجى التأكد من البريد الالكتروني أو كلمة المرور"),
              actions: <Widget>[
                FlatButton(
                  child: Text("حسناً"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            ));
  }

  SqlHelper sql = new SqlHelper();
  /////////////////////////////////////////////
  @required
  VoidCallback onPressed;

  _LoginTabState({this.onPressed});
  @override
  void initState() {
    laod = false;
    super.initState();
  }

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
                alignment: Alignment.bottomRight,
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
                      AppLocalizations.of(context).signUp,
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromRGBO(35, 49, 66, 1),
                      ),
                    )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
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
                    AppLocalizations.of(context).logIn,
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
            height: MediaQuery.of(context).size.height * 0.64,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0)),
            ),
            child: laod
                ? Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/DrawerBG.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Center(
                          child: Logo(
                        logosize: 200,
                      )),
                      Center(
                        child: SpinKitPulse(
                          color: Colors.white,
                          size: 200.0,
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.height * 0.08,
                              child: Image.asset("assets/Logo.png"),
                            )),
                        new Text(AppLocalizations.of(context).title,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 40)),
                        TxtFeild(
                          controller: username,
                          txt: AppLocalizations.of(context).userName,
                          icon: Icon(Icons.person),
                          obscure: false,
                        ),
                        TxtFeild(
                            controller: password,
                            txt: AppLocalizations.of(context).password,
                            icon: Icon(Icons.lock),
                            obscure: true),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPassword(),
                                          ));
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .forgetPassword,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0,
                                            color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          5 /
                                          18,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              17,
                                      child: FlatButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    25.0)),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          setState(() {
                                            laod = true;
                                          });
                                          SqlHelper.login(
                                                  email: username.text,
                                                  password: password.text)
                                              .then((v) {
                                            setState(() {
                                              laod = false;
                                            });
                                            if (!SqlHelper.status)
                                              wrongUser(context);
                                            else
                                              Navigator.pushNamed(
                                                  context, "/LocationSet");
                                          });
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                                AppLocalizations.of(context)
                                                    .logIn,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white)),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            )
                                          ],
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
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
