import 'package:apollodeliver/Models/Admin.dart';
import 'package:apollodeliver/Models/Product.dart';
import 'package:apollodeliver/Models/StoreCategory.dart';

class Store {
  int? id;
  String? name;
  String? logo;
  String? homeImage;
  String? dealsImage;
  String? dealsSquareImage;
  String? interactiveImage;
  Admin? admin;
  List<StoreCategory>? storeCategoryList;
  List<Product>? productlist;

  Store({this.id, this.name, this.logo, this.homeImage, this.dealsImage, this.dealsSquareImage, this.interactiveImage, this.admin, this.storeCategoryList, this.productlist});
}