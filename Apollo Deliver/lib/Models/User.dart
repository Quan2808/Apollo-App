import 'package:apollodeliver/Models/Address.dart';
import 'package:apollodeliver/Models/Cart.dart';
import 'package:apollodeliver/Models/PaymentMethod.dart';
import 'package:apollodeliver/Models/Review.dart';
import 'package:apollodeliver/Models/ShopOrder.dart';

class User {
  int? id;
  String? clientName;
  String? password;
  bool? enabled;
  Set<Address>? address;
  String? email;
  String? role;
  Cart? cart;
  Set<ShopOrder>? shopOrders;
  List<Review>? reviewList;
  Set<PaymentMethod>? paymentMethods;

  User({this.id, this.clientName, this.password, this.enabled, this.address, this.email, this.role, this.cart, this.shopOrders, this.reviewList, this.paymentMethods});
}