import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kaf/models/post_model.dart';
import 'package:kaf/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SqlHelper {
  static String webSite = "http://kaf.ideagroup-sa.com/api/user";
  User user;
  static bool status =false;
  static bool loading  = true;
  getData() async {
    String url = "http://kaf.ideagroup-sa.com/api/user/me";
    http.Response response = await http.post(url, headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9rYWYuaWRlYWdyb3VwLXNhLmNvbVwvYXBpXC91c2VyXC9sb2dpbiIsImlhdCI6MTU4MDA4NDE0MywiZXhwIjoxNTgwMDg3NzQzLCJuYmYiOjE1ODAwODQxNDMsImp0aSI6IkROTlk1UDdyaE1mMGJSejQiLCJzdWIiOjMsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.rP5NXTcvWr3vcVau0uHBd9TDlxIWFFs86Mj-mWGR9fk'
    });
    return json.decode(response.body);
  }

  static Future <List>login({@required String email, @required String password}) async {
    loading= true;
    String url = "$webSite/login";
    final http.Response response = await http
        .post(url, body: {"email": "$email", "password": "$password"});
    status = response.body.contains('token');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["token"]}');
      _save('token', data["token"]);
    } else {
        print('data : ${data["error"]}');
    }
    loading = false;
    return null;
  }

  Future register(
      {@required String name,
      @required String email,
      @required String password}) async {
    String url = "$webSite/register";
    print(url);
    http.Response response = await http.post(url,
        body: {"email": "$email", "name": "$name", "password": "$password"});
    status = response.body.contains('token');
    var data = json.decode(response.body);
    if (!status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      if (data != 'null') _save('token', data["token"]);
    }
  }

  static _save(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static _load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get(key) ?? 0);
    return prefs.get(key) ?? 0;
  }

  Future <List<dynamic>>getOffers(String country, String city, String hasOffer) async {
    String url = "http://kaf.ideagroup-sa.com/api/offers";
    http.Response response = await http.post(url, body: {
      "Country": "$country",
      "City": "$city",
      "hasOffer":"$hasOffer"
    }
    );
    return json.decode(response.body);
  }

    Future <List>getKnowledge() async {
    String url = "http://kaf.ideagroup-sa.com/api/knowledge";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Future <List<dynamic>>getDoctor(int id) async {
    String url = "http://kaf.ideagroup-sa.com/api/doctor";
    http.Response response = await http.post(url
    ,body: {
      "doctor_id":"$id",
    }
    );
    return json.decode(response.body);
  }

  Future <List>search(String keyWord) async {
    String url = "http://kaf.ideagroup-sa.com/api/search";
    http.Response response = await http.post(url
    ,body: {
      "keyword":"$keyWord",
    }
    );
    return json.decode(response.body);
  }

  Future <List> needs() async {
    String url = "http://kaf.ideagroup-sa.com/api/need";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  addNeed(PostModel post) async {
    String url = "http://kaf.ideagroup-sa.com/api/need";
    http.Response response = await http.post(url,
    
    body: {
      "text":post.text,
      "user_id":post.user.id,
      'address':post.location,
      'image':post.imageUrl
    }
    );
    print(response.body);
    return json.decode(response.body);
  }

  uploadImage(File image,String pathOnServer) async {
    String url = "http://kaf.ideagroup-sa.com/api/uploadImage";
    String type = image.path.split('.').last;

    http.Response response = await http.post(url,
    body:{
     "image":base64Encode(image.readAsBytesSync()),
     "type":type,
     "pathOnServer":pathOnServer
    }
    );
    print(response.body);
    return json.decode(response.body);
  }

}
