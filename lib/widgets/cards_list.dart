import 'package:flutter/material.dart';
import 'package:kaf/models/best_deals.dart';
import 'package:kaf/models/clinic_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RecentCards extends StatefulWidget {
  @override
  _RecentCardsState createState() => _RecentCardsState();
}

class _RecentCardsState extends State<RecentCards> {
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
          itemCount: BestDeals().deals.length,
          itemBuilder: (BuildContext context, int index) {
            final ClinicCard card = BestDeals().deals[index];
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
                    Image.asset(card.clinic.clinicImgUrl),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/Clinic_info");
                      },
                                          child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                        width: double.infinity,
                        height: 125,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(card.clinic.clinicName,style: TextStyle(fontSize: 25,color: Theme.of(context).primaryColor),),
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
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child:
                                              Text(card.clinic.clinicHospitalName,style: TextStyle(color: Theme.of(context).primaryColor)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      
                                      children: <Widget>[
                                        Icon(Icons.location_on,size: 20,color: Theme.of(context).accentColor,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 3),
                                          child: Text(card.clinic.clinicAddress,style: TextStyle(color: Theme.of(context).accentColor)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: card.isLiked ? Icon(
                                    MdiIcons.heart,
                                    size: 35,
                                    color: Colors.red,
                                  ):Icon(
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
                                        Text("Price",style: TextStyle(color: Colors.black45),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 35),
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
                                      card.price.toString() + " SR",
                                      style: TextStyle(fontSize: 25,color: Theme.of(context).accentColor),
                                    )
                                  ],
                                ),
                                Container(
                                    color: Colors.black45, height: 30, width: 0.2),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Rating",style: TextStyle(color: Colors.black45)),
                                    Row(
                                      children: <Widget>[
                                        Text(card.clinic.clinicRate.toString()),
                                        Icon(
                                          MdiIcons.star,
                                          size: 18,
                                          color: Color.fromRGBO(255, 227, 34, 1),
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
