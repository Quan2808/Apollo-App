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

  ShopOrder({
    this.id,
    this.user,
    this.variant,
    this.orderDate,
    this.deliveryDate,
    this.status,
    this.address,
    this.paymentMethod,
    this.shippingMethod,
    this.quantity,
    this.orderTotal,
    this.orderDeliveries,
  });

  factory ShopOrder.fromJson(Map<String, dynamic> json) {
    return ShopOrder(
      id: json['id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      variant: json['variant'] != null ? Variant.fromJson(json['variant']) : null,
      orderDate: json['orderDate'],
      deliveryDate: json['deliveryDate'] != null ? DateTime.parse(json['deliveryDate']) : null,
      status: json['status'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      paymentMethod: json['paymentMethod'] != null ? PaymentMethod.fromJson(json['paymentMethod']) : null,
      shippingMethod: json['shippingMethod'] != null ? ShippingMethod.fromJson(json['shippingMethod']) : null,
      quantity: json['quantity'],
      orderTotal: json['orderTotal'],
      orderDeliveries: (json['orderDeliveries'] as List?)
          ?.map((item) => OrderDelivery.fromJson(item))
          .toSet(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user?.toJson(),
    'variant': variant?.toJson(),
    'orderDate': orderDate,
    'deliveryDate': deliveryDate?.toIso8601String(),
    'status': status,
    'address': address?.toJson(),
    'paymentMethod': paymentMethod?.toJson(),
    'shippingMethod': shippingMethod?.toJson(),
    'quantity': quantity,
    'orderTotal': orderTotal,
    'orderDeliveries': orderDeliveries?.map((item) => item.toJson()).toList(),
  };
}
