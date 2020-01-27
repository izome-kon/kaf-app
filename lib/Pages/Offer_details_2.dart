import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:kaf/localizations.dart';
import 'Clinic_info.dart' as prefix0;
import 'dart:async';
import 'clinic_info.dart';

class offer_details_2 extends StatefulWidget {
  @override
  _offer_details_2State createState() => _offer_details_2State();
}

class _offer_details_2State extends State<offer_details_2> {
  Clinic clinic;
  bool taken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taken = false;
  }

  @override
  Widget build(BuildContext context) {
    clinic = new Clinic();
    clinic.clinc_name = "Cardiology Clinic";
    clinic.hospital_name = "international medical hospital";
    clinic.rate = 4.0;
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  pinned: true,
                  expandedHeight: 160,
                  elevation: 20,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          "assets/clinicBG.png",
                          fit: BoxFit.cover,
                        ),
                        Image.asset("assets/BGevelution.png",
                            fit: BoxFit.cover),
                      ],
                    ),
                    title: Text(clinic.clinc_name),
                    centerTitle: true,
                  ),
                ),
                SliverFillRemaining(
                  child: cardo(clinic),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardo(Clinic clinic) {
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: <Widget>[
                header_info(clinic),
                Divider(
                  height: 2,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),
                Doctor_details(),
                Divider(
                  height: 2,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "92/6, 3rd Floor, Outer Ring Road, Jeddah",
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
                Map_location(),
                Divider(
                  height: 2,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),
                conditions_card(),
                FlatButton(
                  shape: taken
                      ? null
                      : new RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: new BorderRadius.circular(18.0)),
                  color: Colors.white,
                  disabledColor: Colors.grey,
                  onPressed: taken
                      ? null
                      : () {
                          setState(() {
                            taken = true;
                          });
                        },
                  child: Text(
                      taken
                          ? "Taked !"
                          : AppLocalizations.of(context).takeThisOffer,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: taken
                              ? Colors.white
                              : Theme.of(context).primaryColor)),
                )
              ],
            ),
          ),
        ]);
  }

  Widget conditions_card() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).conditionForAbtaining,
          style: TextStyle(
              fontSize: 17,
              color: Theme.of(context).accentColor,
              wordSpacing: 2),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "- Exceded 8 years.",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "- KAF application is ",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "not responsable",
                      style: TextStyle(
                          fontSize: 15, color: Theme.of(context).accentColor),
                    ),
                    Text(
                      " for ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Text(
                  " any improper of clinics.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              onChanged: (T) {},
              value: true,
            ),
            Text("i accept these terms",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                )),
          ],
        )
      ],
    );
  }

  Widget Map_location() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 9 + 20,
          width: MediaQuery.of(context).size.width - 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage("assets/Map.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget Doctor_details() {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: new AssetImage("assets/Doctor.png"),
                        fit: BoxFit.cover,
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Dr. Mahmoud Metwali",
                          style: TextStyle(
                              color: Color.fromRGBO(35, 49, 66, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "B.Sc,MD - Cadiology",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          "Advisory",
                          style: TextStyle(
                              color: Color.fromRGBO(35, 49, 66, 1),
                              fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 25,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text(AppLocalizations.of(context).moreDetails,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget header_info(Clinic clinic) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(clinic.clinc_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(35, 49, 66, 1))),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_city,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                    Text(
                      clinic.hospital_name,
                      style: TextStyle(color: Color.fromRGBO(35, 49, 66, 1)),
                    ),
                  ],
                ),
                StarRating(
                    rating: clinic.rate,
                    size: 25.0,
                    color: Colors.orange,
                    borderColor: Colors.grey,
                    starCount: 5,
                    onRatingChanged: (rating) => setState(
                          () {},
                        ))
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "50%",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(201, 71, 71, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                              AppLocalizations.of(context).price +
                                  "           ",
                              style: TextStyle(fontSize: 12)),
                          Text(
                            "500" + AppLocalizations.of(context).sr,
                            style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          "125 " + AppLocalizations.of(context).sr,
                          style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).accentColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        );
  }
}
