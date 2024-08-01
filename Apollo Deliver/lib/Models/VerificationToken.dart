import 'package:apollodeliver/Models/Shipper.dart';
import 'package:apollodeliver/Models/User.dart';

class VerificationToken {
  int? id;
  String? token;
  User? user;
  Shipper? shipper;
  DateTime? expiryDate;

  VerificationToken({this.id, this.token, this.user, this.shipper, this.expiryDate});
}