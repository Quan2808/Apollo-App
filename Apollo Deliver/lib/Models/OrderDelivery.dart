import 'package:apollodeliver/Models/Shipper.dart';
import 'package:apollodeliver/Models/ShopOrder.dart';

class OrderDelivery {
  int? id;
  ShopOrder? order;
  Shipper? shipper;
  DateTime? assignedDate;
  String? status;
  String? inducement;

  OrderDelivery({this.id, this.order, this.shipper, this.assignedDate, this.status, this.inducement});
}