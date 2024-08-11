import 'package:apolloshop/data/models/address/address_model.dart';
import 'package:apolloshop/data/models/cart/cart_item_model.dart';
import 'package:apolloshop/data/models/payment_method/payment_method_model.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String user;
  final String status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final PaymentMethodModel paymentMethod;
  final AddressModel? address;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.user,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.address,
    required this.items,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'status': status,
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
      'deliveryDate': deliveryDate?.toIso8601String(),
      'paymentMethod': paymentMethod.toJson(),
      'address': address?.toJson(),
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return OrderModel(
      id: snapshot['id'],
      user: snapshot['user'],
      status: snapshot['status'],
      totalAmount: snapshot['totalAmount'],
      orderDate: DateTime.parse(snapshot['orderDate']),
      deliveryDate: snapshot['deliveryDate'] != null
          ? DateTime.parse(snapshot['deliveryDate'])
          : null,
      paymentMethod: PaymentMethodModel.fromJson(snapshot['paymentMethod']),
      address: snapshot['address'] != null
          ? AddressModel.fromJson(snapshot['address'])
          : null,
      items: (snapshot['items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
