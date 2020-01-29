import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/models/doctor_model.dart';
import 'package:kaf/models/clinic_model.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'gallery.dart';

class Doctor_info extends StatefulWidget {
  @override
  _Doctor_infoState createState() => _Doctor_infoState();
}

class _Doctor_infoState extends State<Doctor_info> {
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
    clinic.offer = 50;
    clinic.price = 500;
    clinic.status = false;
    clinic.address = "92/6, 3rd Floor, Outer Ring Road, Jeddah";
    clinic.photo = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQpAhiikVdPYN4lQQTs55zTP5DZ-aXPPX911PgWbVUIqJwhCyeQ';
    doctor.yearsOfEperience = 14;
    doctor.name = "Mahmoud Abo Metwli";
    doctor.rate = 4.8;
    doctor.field = "B.Sc.MD-Cardoilogy";
    doctor.images = new List<String>();
    doctor.profileImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRFFULKS9deO06AFbzEWpy49NXfKcrU6nRwUjo3LUMHLnCXPRaa";
    doctor.images.add("http://kaf.ideagroup-sa.com/image/doctors/doctor1.jpg");
    doctor.images.add("http://kaf.ideagroup-sa.com/image/doctors/doctor1.jpg");
    doctor.images.add("http://kaf.ideagroup-sa.com/image/doctors/doctor1.jpg");
    doctor.images.add("http://kaf.ideagroup-sa.com/image/doctors/doctor1.jpg");
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0))),
                )
              ],
            ),
          ),
          Image.asset(
            "asserts/DrawerBG.png",
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: card1(),
                  ),
                  cardo(clinic)
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              alignment: Alignment.topLeft,
            ),
          ),
        ],
      ),
    );
  }

  Widget card1() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        color: Colors.blue.withOpacity(0),
        width: MediaQuery.of(context).size.width - 40,
        height: 250,
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      doctor.yearsOfEperience.toString(),
                                      style: TextStyle(
                                          color: Color.fromRGBO(35, 49, 66, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .yearsExperience,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 25,
                                    ),
                                    Text(
                                      doctor.rate.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(doctor.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromRGBO(35, 49, 66, 1))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(doctor.field,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey)),
                          ),
                        ),
                        photo_view()
                      ],
                    ),
                  )),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.white),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: new NetworkImage(doctor.profileImage),
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

  Widget photo_view() {
    if (doctor.images.length >= 4) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            photo(doctor.images[0]),
            photo(doctor.images[1]),
            photo(doctor.images[2]),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhotoGallery1(doctor.images[3], doctor.images)),
                  );
                },
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.darken),
                      image: new NetworkImage(doctor.images[3]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "+" + (doctor.images.length - 3).toString(),
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      );
    } else if (doctor.images.length == 3) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            photo(doctor.images[0]),
            photo(doctor.images[1]),
            photo(doctor.images[2]),
          ],
        ),
      );
    } else if (doctor.images.length == 2) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            photo(doctor.images[0]),
            photo(doctor.images[1]),
          ],
        ),
      );
    } else if (doctor.images.length == 1){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            photo(doctor.images[0]),
          ],
        ),
      );
    }else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
      
      );
    }
  }

  Widget cardo(Clinic clinic) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        height: 485,
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
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
            Spacer(),
            FlatButton(
              shape: new RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: new BorderRadius.circular(18.0)),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/Offer_details_2");
              },
              child: Text("Take this offer",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            )
          ],
        ),
      ),
    );
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

  Widget Timing(Clinic clinic) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Center(
                  child: Text(
            AppLocalizations.of(context).closedToday,
            style: TextStyle(fontSize: 10, color: Colors.red),
          ))),
          VerticalDivider(
            color: Colors.white,
          ),
          Container(
              width: (MediaQuery.of(context).size.width - 30) / 3,
              child: Center(
                  child: Text(
                "09:30AM - 08:00PM",
                style: TextStyle(
                    fontSize: 10, color: Color.fromRGBO(35, 49, 66, 1)),
              ))),
          VerticalDivider(
            color: Colors.white,
          ),
          Container(
            height: 25,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text(AppLocalizations.of(context).allTimaing,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  Widget header_info(Clinic clinic) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(clinic.clinicName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color.fromRGBO(35, 49, 66, 1))),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_city,
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                        Text(
                          clinic.hospitalName,
                          style: TextStyle(
                              color: Color.fromRGBO(35, 49, 66, 1),
                              fontSize: 10),
                        ),
                      ],
                    ),
                    StarRating(
                        rating: clinic.rate.toDouble(),
                        size: 20.0,
                        color: Colors.orange,
                        borderColor: Colors.grey,
                        starCount: 5,
                        onRatingChanged: (rating) => setState(
                              () {},
                            ))
                  ],
                ),
              ),
              Spacer(),
              price()
            ],
          ),
        ),
      ),
    );
  }
  Widget price(){
    if(clinic.offer>0){
      return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          clinic.offer.toString() + "%",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                        width: 40,
                        height: 20,
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
                            Text(AppLocalizations.of(context).price + "    ",
                                style: TextStyle(fontSize: 8)),
                            Text(
                              clinic.price.toString()+" " + AppLocalizations.of(context).sr,
                              style: TextStyle(
                                  fontSize: 8,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                        Center(
                          child: Text(
                            (clinic.price*(clinic.offer/100)).toString()+" " + AppLocalizations.of(context).sr,
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
    }else {
      return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(AppLocalizations.of(context).price + "    ",
                                style: TextStyle(fontSize: 8)),
                          ],
                        ),
                        Center(
                          child: Text(
                            (clinic.price).toString()+" " + AppLocalizations.of(context).sr+" ",
                          style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
    }
  }
  Widget photo(String path) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PhotoGallery1(path, doctor.images)),
        );
      },
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: new NetworkImage(path),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
