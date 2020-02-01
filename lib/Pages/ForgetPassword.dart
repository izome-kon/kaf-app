import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/widgets/TxtField.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  
  @override
  Widget build(BuildContext context){
   
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).resetPassword),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/resetPassword.png',width: 200,height: 200,),
              Text(
                AppLocalizations.of(context).forgetPassword,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width - 50,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Enter your e-mail addess and we will send you a link to reset your password')
                      ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: TxtFeild(
                    txt: AppLocalizations.of(context).email,
                    icon: Icon(Icons.email),
                    obscure: false),
              ),
             RaisedButton(
                              onPressed: (){},
                              child: Text(
                                'Reset Password',
                                style: TextStyle(color: Colors.white,fontSize: 16),
                              ),
                              color: Theme.of(context).accentColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  
                                  ),
                            )
            ],
          ),
        ],
      ),
    );
  }
}
