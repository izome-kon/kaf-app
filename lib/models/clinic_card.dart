import 'package:kaf/models/clinic_model.dart';

class ClinicCard{
  final Clinic clinic;
  bool isLiked;
  final int pastPrice;
  final int price;
  final int youSaved;

  ClinicCard({
    this.clinic,
    this.isLiked,
    this.pastPrice,
    this.price,
    this.youSaved,
  });
}