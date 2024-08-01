import 'package:apollodeliver/Models/Product.dart';

class Category {
  int? id;
  String? attribute;
  Category? parentCategory;
  List<Product>? products;

  Category({this.id, this.attribute, this.parentCategory, this.products});
}