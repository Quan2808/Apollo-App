import 'package:apolloshop/data/models/cart/cart_model.dart';
import 'package:apolloshop/data/models/product/variant_model.dart';

class CartLineModel {
  int id;
  int quantity;
  CartModel? cart;
  VariantModel? variant;

  CartLineModel({
    required this.id,
    required this.quantity,
    this.cart,
    this.variant,
  });

  static CartLineModel empty() {
    return CartLineModel(
      id: 0,
      quantity: 0,
      cart: null,
      variant: null,
    );
  }

  factory CartLineModel.fromJson(Map<String, dynamic> json) {
    return CartLineModel(
      id: json['id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      cart: json['cart'] != null ? CartModel.fromJson(json['cart']) : null,
      variant: json['variant'] != null ? VariantModel.fromJson(json['variant']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'cart': cart?.toJson(),
      'variant': variant?.toJson(),
    };
  }

  CartLineModel copyWith({
    int? id,
    int? quantity,
    CartModel? cart,
    VariantModel? variant,
  }) {
    return CartLineModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      cart: cart ?? this.cart,
      variant: variant ?? this.variant,
    );
  }
}
