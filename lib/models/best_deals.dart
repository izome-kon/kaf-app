import 'dart:convert';

import 'package:kaf/models/clinic_card.dart';
import 'package:kaf/models/clinic_model.dart';
import 'package:kaf/models/doctor_model.dart';
import 'package:kaf/sql/sqlHelper.dart';

class BestDeals{
  SqlHelper sqlHelper= new SqlHelper();
  List<ClinicCard> deals ;
  BestDeals(List list){
  deals = new List<ClinicCard>();
  for (var item in list) {
    deals.add(ClinicCard(clinic: Clinic(
       clinicName: item['name'],
      address:item['Address'],
      hospitalName: "International Medical Hospital",
      iD: item['id'],
      rate: item['Rate'],
      photo: "assets/catering image@2x.png"
    ),
    isLiked: false,
    pastPrice: 300,
    price: 150,
    youSaved: 150,
    )
    );
  }

  }
  getList(){
    return deals;
  }


}