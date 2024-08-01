import 'package:apollodeliver/Models/Admin.dart';
import 'package:apollodeliver/Models/Shipper.dart';
import 'package:apollodeliver/Models/ShopOrder.dart';
import 'package:apollodeliver/Models/User.dart';

class Address {
  int? id;
  String? district;
  String? ward;
  String? city;
  String? street;
  User? user;
  Shipper? shipper;
  Admin? admin;
  Set<ShopOrder>? shopOrders;

  Address({this.id, this.district, this.ward, this.city, this.street, this.user, this.shipper, this.admin, this.shopOrders});
}