import 'package:apolloshop/data/request/order/order_item_request.dart';

class OrderRequest {
  final String userId;
  final List<OrderItemRequest> orderItems;
  final String orderDate;
  final String addressId;
  final int paymentMethodId;
  final int shippingMethodId;
  final double orderTotal;

  OrderRequest({
    required this.userId,
    required this.orderItems,
    required this.orderDate,
    required this.addressId,
    required this.paymentMethodId,
    required this.shippingMethodId,
    required this.orderTotal,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return OrderRequest(
      userId: json['userId'] ?? '',
      orderItems: (json['orderItems'] as List<dynamic>?)
              ?.map((item) =>
                  OrderItemRequest.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      orderDate: json['orderDate'] ?? '',
      addressId: json['addressId'] ?? '',
      paymentMethodId: json['paymentMethod'] ?? 0,
      shippingMethodId: json['shippingMethod'] ?? 0,
      orderTotal: (json['orderTotal'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
      'orderDate': orderDate,
      'addressId': addressId,
      'paymentMethodId': paymentMethodId,
      'shippingMethodId': shippingMethodId,
      'orderTotal': orderTotal,
    };
  }
}
