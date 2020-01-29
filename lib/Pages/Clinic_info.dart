import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:kaf/models/doctor_model.dart';
import '../localizations.dart';
import 'Doctor_info.dart';
import 'Offer_details_2.dart';
import 'package:kaf/models/clinic_model.dart';


class Clinic_info extends StatefulWidget {
  @override
  _Clinic_infoState createState() => _Clinic_infoState();
}

class _Clinic_infoState extends State<Clinic_info> {
  Clinic clinic;
  Doctor doctor;
  @override
  Widget build(BuildContext context) {
    clinic = new Clinic();
    doctor = new Doctor();
    clinic.clinicName = "al hayah Clinic";
    clinic.hospitalName = "international medical hospital";
    clinic.rate = 4;
    clinic.field = "Cardiology Clinic";
    clinic.offer = 0;
    clinic.price = 500;
    clinic.status = false;
    clinic.address = "92/6, 3rd Floor, Outer Ring Road, Jeddah";
    clinic.photo = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQpAhiikVdPYN4lQQTs55zTP5DZ-aXPPX911PgWbVUIqJwhCyeQ';
    doctor.name = "Dr. Mahmoud Metwali";
    doctor.field = "B.Sc,MD - Cadiology";
    doctor.jopTitle = "Advisory";
    doctor.profileImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRFFULKS9deO06AFbzEWpy49NXfKcrU6nRwUjo3LUMHLnCXPRaa";
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage("assets/DrawerBG.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
                      Image.network(
                        clinic.photo,
                        fit: BoxFit.cover,
                      ),
                      Image.asset("assets/BGevelution.png", fit: BoxFit.cover),
                    ],
                  ),
                  title: Text(clinic.clinicName),
                  centerTitle: true,
                ),
              ),
              SliverFillRemaining(
                child: cardo(clinic),
              )
              //  SliverFixedExtentList(
              //    itemExtent: MediaQuery.of(context).size.height,
              //    delegate: SliverChildListDelegate([
              //      cardo(clinic),
              //    ]),
              //  )
            ],
          ),
        )
      ],
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
                Timing(clinic),
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
                          clinic.address,
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
                Feedback(),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                      borderRadius: new BorderRadius.circular(18.0)),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => offer_details_2()),
                    );
                  },
                  child: Text(AppLocalizations.of(context).takeThisOffer,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                )
              ],
            ),
          ),
        ]);
  }

  Widget Feedback() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 181,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocalizations.of(context).feedback,
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  )),
            ),
            AnyFeed_back("Ahmed", "good .", 3, "just now"),
            Divider(
              height: 2,
              endIndent: 40,
              indent: 40,
              color: Colors.grey,
            ),
            AnyFeed_back("Mohamed", "very good .", 4, "just now"),
            Divider(
              endIndent: 40,
              indent: 40,
              color: Colors.grey,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).viewAllFeedBack,
                  style: TextStyle(
                      color: Color.fromRGBO(35, 49, 66, 1),
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  Widget AnyFeed_back(String name, String stat, double rate, String time) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: new AssetImage("assets/comment.png"),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        color: Color.fromRGBO(35, 49, 66, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    stat,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              StarRating(
                  rating: rate,
                  size: 20.0,
                  color: Colors.orange,
                  borderColor: Colors.grey,
                  starCount: 5,
                  onRatingChanged: (rating) => setState(
                        () {},
                      ))
            ],
          )
        ],
      ),
    );
  }

  Widget Map_location() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 9 + 5,
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
                        image: new NetworkImage(doctor.profileImage),
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
                          doctor.name,
                          style: TextStyle(
                              color: Color.fromRGBO(35, 49, 66, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          doctor.field,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          doctor.jopTitle,
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 25,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Doctor_info()),
                    
                  );
                },
                child: Text(AppLocalizations.of(context).moreDetails,
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row Timing(Clinic clinic) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: (MediaQuery.of(context).size.width - 30) / 3,
            child: Center(
                child: Text(
              AppLocalizations.of(context).closedToday,
              style: TextStyle(fontSize: 14, color: Colors.red),
            ))),
        Container(
            width: (MediaQuery.of(context).size.width - 30) / 3,
            child: Center(
                child: Text(
              "09:30AM - 08:00PM",
              style:
                  TextStyle(fontSize: 12, color: Color.fromRGBO(35, 49, 66, 1)),
            ))),
        Container(
          height: 25,
          child: FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Text(AppLocalizations.of(context).allTimaing,
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Padding header_info(Clinic clinic) {
    return Padding(
        padding: const EdgeInsets.only(left: 17.0, top: 15.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(clinic.field,
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
                      clinic.hospitalName,
                      style: TextStyle(color: Color.fromRGBO(35, 49, 66, 1)),
                    ),
                  ],
                ),
                StarRating(
                    rating: clinic.rate.toDouble(),
                    size: 25.0,
                    color: Colors.orange,
                    borderColor: Colors.grey,
                    starCount: 5,
                    onRatingChanged: (rating) => setState(
                          () {},
                        ))
              ],
            ),
            Spacer(),
            price()
          ],
        ));
  }
  Widget price (){
    if(clinic.offer>0){
      return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        clinic.offer.toString() + "%",
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
                            clinic.price.toString()+" " + AppLocalizations.of(context).sr,
                            style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          (clinic.price*(clinic.offer/100)).toString()+" " + AppLocalizations.of(context).sr,
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
    }else{
      return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              AppLocalizations.of(context).price +
                                  "           ",
                              style: TextStyle(fontSize: 12)),
                        
                        ]
                      ),
                      Center(
                        child: Text(
                          (clinic.price).toString()+" " + AppLocalizations.of(context).sr+" ",
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
    }
  }
}
