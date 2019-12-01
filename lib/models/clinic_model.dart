import 'package:kaf/models/doctor_model.dart';

class Clinic{
  final int clinicID;
  final String clinicHospitalName;
  final String clinicAddress;
  final String clinicPhone;
  final String clinicImgUrl;
  final String clinicName;
  final double clinicRate;
  final Doctor doctor;

  Clinic(
    {
      this.clinicID,
      this.clinicAddress,
      this.clinicHospitalName,
      this.clinicPhone,
      this.clinicRate,
      this.doctor,
      this.clinicImgUrl,
      this.clinicName
    }
  );

}