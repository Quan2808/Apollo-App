import 'package:apollodeliver/Models/Address.dart';
import 'package:apollodeliver/Models/Review.dart';

class Shipper {
  int? id;
  String? shipperName;
  String? password;
  String? phoneNumber;
  bool? enabled;
  Set<Address>? address;
  String? email;
  String? role;
  List<Review>? reviewList;

  Shipper({this.id, this.shipperName, this.password, this.phoneNumber, this.enabled, this.address, this.email, this.role, this.reviewList});
}