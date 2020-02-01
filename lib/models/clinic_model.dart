import 'package:kaf/models/doctor_model.dart';

class Clinic {
  int iD;
  String hospitalName;
  String clinicName;
  int rate;
  String address;
  String field;
  int offer;
  int price;
  bool status;
  String time;
  List<String> allTimming;
  String location;
  String photo;
  String doctorId;
  
  
  Clinic(
      {this.iD,
      this.hospitalName,
      this.clinicName,
      this.rate,
      this.address,
      this.field,
      this.offer,
      this.price,
      this.status,
      this.time,
      this.allTimming,
      this.location,
      this.photo,
      this.doctorId});
}
