import 'package:apollodeliver/Models/Product.dart';

class ProductAttribute {
  int? id;
  String? name;
  String? value;
  Product? product;

  ProductAttribute({this.id, this.name, this.value, this.product});
}