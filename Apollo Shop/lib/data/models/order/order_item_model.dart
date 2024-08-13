import 'package:apolloshop/data/models/product/variant_model.dart';

class OrderItemModel {
  final int id;
  final VariantModel variant;
  final int quantity;
  final double price;

  OrderItemModel({
    required this.id,
    required this.variant,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      variant: VariantModel.fromJson(json['variant']),
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'variant': variant.toJson(),
      'quantity': quantity,
      'price': price,
    };
  }
}
