import 'package:apollodeliver/Models/Bullet.dart';
import 'package:apollodeliver/Models/Category.dart';
import 'package:apollodeliver/Models/HashTag.dart';
import 'package:apollodeliver/Models/OptionTable.dart';
import 'package:apollodeliver/Models/ProductAttribute.dart';
import 'package:apollodeliver/Models/Store.dart';
import 'package:apollodeliver/Models/StoreCategory.dart';
import 'package:apollodeliver/Models/Variant.dart';

class Product {
  int? id;
  String? title;
  String? description;
  String? mainPicture;
  String? status;
  DateTime? createAt;
  DateTime? updatedAt;
  Category? category;
  StoreCategory? storeCategory;
  Store? store;
  List<OptionTable>? optionTables;
  List<Variant>? variants;
  List<ProductAttribute>? productAttributes;
  List<HashTag>? hashTagList;
  List<Bullet>? bulletList;

  Product({this.id, this.title, this.description, this.mainPicture, this.status, this.createAt, this.updatedAt, this.category, this.storeCategory, this.store, this.optionTables, this.variants, this.productAttributes, this.hashTagList, this.bulletList});
}