import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/sql/sqlHelper.dart';
import 'package:kaf/widgets/TxtField.dart';

class SignUpTab extends StatefulWidget {
  @required
  VoidCallback onPressed;
  SignUpTab({this.onPressed});
  @override
  _SignUpTabState createState() => _SignUpTabState(onPressed: onPressed);
}

class _SignUpTabState extends State<SignUpTab> {
  SqlHelper sql = new SqlHelper();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();

  wrongUser() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("تنبيه"),
              content: Text("يرجى التأكد من البريد الالكتروني أو كلمة المرور"),
              actions: <Widget>[
                FlatButton(
                  child: Text("حسناً"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @required
  VoidCallback onPressed;
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
                      AppLocalizations.of(context).logIn,
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
                    AppLocalizations.of(context).signUp,
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
            height: MediaQuery.of(context).size.height * 0.87,
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
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.08,
                        child: Image.asset("assets/Logo.png"),
                      )),
                  new Text(AppLocalizations.of(context).title,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 40)),
                  TxtFeild(
                    txt: AppLocalizations.of(context).fullName,
                    icon: Icon(Icons.person),
                    obscure: false,
                    controller: fullName,
                  ),
                  TxtFeild(
                      txt: AppLocalizations.of(context).userName,
                      icon: Icon(Icons.person),
                      obscure: false),
                  TxtFeild(
                    txt: AppLocalizations.of(context).email,
                    icon: Icon(Icons.email),
                    obscure: false,
                    controller: username,
                  ),
                  TxtFeild(
                    txt: AppLocalizations.of(context).password,
                    icon: Icon(Icons.lock),
                    obscure: true,
                    controller: password,
                  ),
                  TxtFeild(
                      txt: AppLocalizations.of(context).phone,
                      icon: Icon(Icons.phone),
                      obscure: false),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*6/20,
                            height: 50,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                sql.register(
                                    name: fullName.text,
                                    email: username.text,
                                    password: password.text)
                                 .then((v) {
                                      if (!SqlHelper.status)
                                        wrongUser();
                                      else
                                        Navigator.pushNamed(
                                            context, "/LocationSet");
                                    });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                        AppLocalizations.of(context).signUp,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white)),
                                  
                                  Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
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
