class OrderRequest {
  final String userId;
  final List<OrderItemRequest> orderItems;
  final String orderDate;
  final String? addressId;
  final int paymentMethodId;
  final int shippingMethodId;
  final double orderTotal;

  OrderRequest({
    required this.userId,
    required this.orderItems,
    required this.orderDate,
    this.addressId,
    required this.paymentMethodId,
    required this.shippingMethodId,
    required this.orderTotal,
  });

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

class OrderItemRequest {
  final int variantId;
  final int quantity;
  final double price;

  OrderItemRequest({
    required this.variantId,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'variantId': variantId,
      'quantity': quantity,
      'price': price,
    };
  }
}
