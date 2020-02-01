import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/models/best_deals.dart';
import 'package:kaf/models/clinic_card.dart';
import 'package:kaf/models/clinic_model.dart';
import 'package:kaf/models/doctor_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RecentCards extends StatelessWidget {
  List list;
  RecentCards(this.list);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: ListView.builder(
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (BuildContext context, int index) {
            final ClinicCard card = ClinicCard(
              clinic: Clinic(
                  clinicName: list[index]['name'],
                  address: list[index]['Address'],
                  hospitalName: "International Medical Hospital",
                  iD: list[index]['id'],
                  rate: list[index]['Rate'],
                  photo: "assets/catering image@2x.png"),
              isLiked: false,
              pastPrice: 300,
              price: 150,
              youSaved: 150,
            );
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  new BoxShadow(blurRadius: 1, color: Colors.black87)
                ], borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Stack(
                  overflow: Overflow.clip,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image.asset(card.clinic.photo),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/Clinic_info");
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                        width: double.infinity,
                        height: 135,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          card.clinic.clinicName,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/hospitalIcon.png",
                                          width: 17.97,
                                          height: 14,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              card.clinic.hospitalName,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Text(card.clinic.address,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .accentColor)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: card.isLiked
                                      ? Icon(
                                          MdiIcons.heart,
                                          size: 35,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          MdiIcons.heartOutline,
                                          size: 35,
                                          color: Colors.red,
                                        ),
                                  onPressed: () {
                                    
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          AppLocalizations.of(context).price,
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35),
                                          child: Text(
                                            card.pastPrice.toString(),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      card.price.toString() +
                                          AppLocalizations.of(context).sr,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Theme.of(context).accentColor),
                                    )
                                  ],
                                ),
                                Container(
                                    color: Colors.black45,
                                    height: 30,
                                    width: 0.2),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(AppLocalizations.of(context).rating,
                                        style:
                                            TextStyle(color: Colors.black45)),
                                    Row(
                                      children: <Widget>[
                                        Text(card.clinic.rate.toString()),
                                        Icon(
                                          MdiIcons.star,
                                          size: 18,
                                          color:
                                              Color.fromRGBO(255, 227, 34, 1),
                                        ),
                                        Text("(500+)")
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
