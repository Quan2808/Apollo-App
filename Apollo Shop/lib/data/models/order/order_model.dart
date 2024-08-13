import 'package:apolloshop/data/models/address/address_model.dart';
import 'package:apolloshop/data/models/order/order_item_model.dart';
import 'package:apolloshop/data/models/payment_method/payment_method_model.dart';
import 'package:apolloshop/data/models/shipping_method/shipping_method_model.dart';
import 'package:apolloshop/data/models/user/user_model.dart';

class OrderModel {
  final int id;
  final UserModel user;
  final String status;
  final double orderTotal;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final AddressModel? address;
  final PaymentMethodModel paymentMethod;
  final ShippingMethodModel shippingMethod;
  final List<OrderItemModel> orderItems;

  OrderModel({
    required this.id,
    required this.user,
    required this.status,
    required this.orderTotal,
    required this.orderDate,
    this.deliveryDate,
    this.address,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      status: json['status'],
      orderTotal: json['orderTotal'],
      orderDate: DateTime.parse(json['orderDate']),
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.parse(json['deliveryDate'])
          : null,
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      paymentMethod: PaymentMethodModel.fromJson(json['paymentMethod']),
      shippingMethod: ShippingMethodModel.fromJson(json['shippingMethod']),
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'status': status,
      'orderTotal': orderTotal,
      'orderDate': orderDate.toIso8601String(),
      'deliveryDate': deliveryDate?.toIso8601String(),
      'address': address?.toJson(),
      'paymentMethod': paymentMethod.toJson(),
      'shippingMethod': shippingMethod.toJson(),
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}
