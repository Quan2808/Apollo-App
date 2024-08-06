import 'package:apolloshop/data/models/cart/cart_model.dart';
import 'package:apolloshop/data/models/product/variant_model.dart';

class CartLineModel {
  int? id;
  int quantity;
  CartModel? cart;
  VariantModel? variant;
  Map<String, String>? selectedVariants;

  CartLineModel({
    this.id,
    required this.quantity,
    this.cart,
    this.variant,
    this.selectedVariants,
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
      cart: json['cartDto'] != null ? CartModel.fromJson(json['cartDto']) : null,
      variant: json['variantDto'] != null
          ? VariantModel.fromJson(json['variantDto'])
          // If it not work, replace to variant
          // ? VariantModel.fromJson(json['variantDto'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'cartDto': cart?.toJson(),
      'variantDto': variant?.toJson(),
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
