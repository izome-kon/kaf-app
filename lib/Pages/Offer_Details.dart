import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Clinic_info.dart';
class offer_details extends StatefulWidget {
  @override
  _offer_detailsState createState() => _offer_detailsState();
}

class _offer_detailsState extends State<offer_details> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 49, 66, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0))),
              )
            ],
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[card1(), card2()],
          ),
        )
      ],
    );
  }

  Widget card1() {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        color: Colors.blue.withOpacity(0),
        width: MediaQuery.of(context).size.width - 20,
        height: 350,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: Material(
                  color: Colors.white,
                  elevation: 20.0,
                  shadowColor: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.white.withOpacity(0),
                    width: MediaQuery.of(context).size.width - 20,
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: new RawMaterialButton(
                            onPressed: () {},
                            child: new Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            fillColor: Color.fromRGBO(35, 49, 66, 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Mahmoud Abo Metwali",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color.fromRGBO(35, 49, 66, 1))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("+09566149562587",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: infocard("National Idenftification Number",
                              "2017170269", Icons.person_outline),
                        ),
                        infocard(
                            "Date of Birth", "15 /8/ 1999", Icons.date_range),
                      ],
                    ),
                  )),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.white),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: new AssetImage("assets/pics/background.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget card2() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 240,
        color: Colors.grey.withOpacity(0),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 50,
              child: Material(
                color: Color.fromRGBO(35, 49, 66, 1),
                elevation: 20.0,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0)),
                child: Center(
                    child: Text(
                  "Discount Coupun",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 190,
                child: Material(
                  color: Colors.white,
                  elevation: 20.0,
                  shadowColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "  Clinic Information",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 4.0),
                          child: Row(
                             children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("El kholy Clinic",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color:
                                          Color.fromRGBO(35, 49, 66, 1))),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_city,
                                        color: Color.fromRGBO(35, 49, 66, 1),
                                        size: 30,
                                      ),
                                      Text(
                                        " International Medical Hospital",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(35, 49, 66, 1)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>Clinic_info() ),
                                  );
                                },
                                child: new Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                                shape: new CircleBorder(),
                                fillColor: Colors.grey,
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "  Discount Information",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Price           ",style: TextStyle(fontSize: 12)),
                                  Text("500 SR",style: TextStyle(fontSize: 12,decoration:TextDecoration.lineThrough),)
                                ],
                              ),
                              Center(
                                child:Text(
                                  "125 SR",
                                  style: TextStyle(fontSize: 30, color: Colors.red),
                                ) ,
                              )
                            ],
                          ),

                        ],
                      )
                      ,
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "  Discount Code",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),
                       Text(
                            "Y3SHG89",
                            style: TextStyle(color: Color.fromRGBO(35, 49, 66,1), fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget infocard(String txt1, String txt2, IconData icon) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width - 80,
      color: Colors.white.withOpacity(0),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  txt1,
                  style: TextStyle(fontSize: 10),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Material(
              color: Colors.white,
              elevation: 8.0,
              shadowColor: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      txt2,
                      style: TextStyle(fontSize: 18, letterSpacing: 3),
                    ),
                    Spacer(),
                    Icon(
                      icon,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
