import 'package:apolloshop/data/models/category_model.dart';

class ProductModel {
  final int? id;
  final String? name;
  final CategoryModel? category;

  ProductModel({
    this.id,
    this.name,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category?.toJson(),
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
    );
  }
}
