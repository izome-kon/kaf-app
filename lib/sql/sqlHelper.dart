import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kaf/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SqlHelper {
  String webSite = "http://kaf.ideagroup-sa.com/api/user";
  User user;
  var status;
  getData() async {
    String url = "http://kaf.ideagroup-sa.com/api/user/me";
    http.Response response = await http.post(url, headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9rYWYuaWRlYWdyb3VwLXNhLmNvbVwvYXBpXC91c2VyXC9sb2dpbiIsImlhdCI6MTU4MDA4NDE0MywiZXhwIjoxNTgwMDg3NzQzLCJuYmYiOjE1ODAwODQxNDMsImp0aSI6IkROTlk1UDdyaE1mMGJSejQiLCJzdWIiOjMsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.rP5NXTcvWr3vcVau0uHBd9TDlxIWFFs86Mj-mWGR9fk'
    });
    return json.decode(response.body);
  }

  login({@required String email,@required String password}) async {
    String url = "$webSite/login";
    final http.Response response = await http
        .post(url, body: {"email": "$email",
         "password": "$password"});
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if(status){
      print('data : ${data["error"]}');
    }else{
    print('data : ${data["token"]}');
    _save('token', data["token"]);
    }

  }

  register({@required String name,@required String email,@required String password}) async {
    String url = "$webSite/register";
    print(url);
    http.Response response = await http.post(url, body: {
      "email": "$email",
      "name": "$name",
      "password": "$password"
    });
    status = response.body.contains('token');
   // print('stat :$status');
    var data = json.decode(response.body);
   // print(data);
    if(!status){
      print('data : ${data["error"]}');
    }else{
    print('data : ${data["token"]}');
    if(data!='null')
    _save('token', data["token"]);
    }
  }


  _save(String key,String value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  _load(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get(key)??0);
    return prefs.get(key) ?? 0;
  }
}
