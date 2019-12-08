import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';

class Set_location extends StatefulWidget {
  @override
  _Set_locationState createState() => _Set_locationState();
}

class _Set_locationState extends State<Set_location> {
  var citys = [
    "jeddah",
    "Sharqia",
    "Bahha",
    "Egypt",
    "Emarat",
    "Soudan",
    "Bahren",
    "Qatar",
    "Makah",
    "Ryaad",
    "kasem",
    "Cairo"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Color.fromRGBO(35, 49, 66, 1),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                color: Colors.white,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 75.0),
            child: Column(
              children: <Widget>[searchfield(), use_curr_loc(), locations()],
            ),
          )
        ],
      ),
    );
  }

  Widget searchfield() {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 50,
      child: Material(
        elevation: 20.0,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(25.0),
        child: TextFormField(
          obscureText: false,
          autofocus: false,
          controller: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Color.fromRGBO(117, 219, 160, 1),
              hintText: AppLocalizations.of(context).selectYourCity,
              prefixIcon: Icon(
                Icons.search,
                size: 40.0,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.white, width: 0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.white, width: 0))),
        ),
      ),
    );
  }

  Widget use_curr_loc() {
    return MaterialButton(
      onPressed: (){
        Navigator.pushNamed(context, "/ActivePhone");
      },
            child: Row(
        children: <Widget>[
          Icon(
            Icons.my_location,
            size: 30.0,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              AppLocalizations.of(context).useCurrentLocation,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget locations() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Material(
        color: Colors.white,
        elevation: 10.0,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          color: Colors.white.withOpacity(0),
          width: MediaQuery.of(context).size.width - 30,
          height: MediaQuery.of(context).size.height - 200,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                child: Row(children: <Widget>[
                  Icon(
                    Icons.flag,
                    size: 26.0,
                    color: Color.fromRGBO(62, 99, 212, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text(
                      "alf maskan",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height - 270,
                  child: ListView.separated(
                    itemCount: citys.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                          child: Text(citys[index]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
