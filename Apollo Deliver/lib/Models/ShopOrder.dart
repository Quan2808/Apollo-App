import 'package:apollodeliver/Models/Address.dart';
import 'package:apollodeliver/Models/OrderDelivery.dart';
import 'package:apollodeliver/Models/PaymentMethod.dart';
import 'package:apollodeliver/Models/ShippingMethod.dart';
import 'package:apollodeliver/Models/User.dart';
import 'package:apollodeliver/Models/Variant.dart';

class ShopOrder {
  int? id;
  User? user;
  Variant? variant;
  String? orderDate;
  DateTime? deliveryDate;
  String? status;
  Address? address;
  PaymentMethod? paymentMethod;
  ShippingMethod? shippingMethod;
  int? quantity;
  double? orderTotal;
  Set<OrderDelivery>? orderDeliveries;

  ShopOrder({this.id, this.user, this.variant, this.orderDate, this.deliveryDate, this.status, this.address, this.paymentMethod, this.shippingMethod, this.quantity, this.orderTotal, this.orderDeliveries});
}
