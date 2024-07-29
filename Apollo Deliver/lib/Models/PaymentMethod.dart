import 'package:apollodeliver/Models/ShopOrder.dart';
import 'package:apollodeliver/Models/User.dart';

class PaymentMethod {
  int? id;
  int? cartNumber;
  String? nameOnCard;
  String? expirationDate;
  bool? defaultPayment;
  Set<ShopOrder>? shopOrderSet;
  User? user;

  PaymentMethod({this.id, this.cartNumber, this.nameOnCard, this.expirationDate, this.defaultPayment, this.shopOrderSet, this.user});
}