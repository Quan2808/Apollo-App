import 'package:apollodeliver/Models/ShopOrder.dart';

class ShippingMethod {
  int? id;
  Set<ShopOrder>? shopOrderSet;
  String? name;
  double? price;

  ShippingMethod({this.id, this.shopOrderSet, this.name, this.price});
}