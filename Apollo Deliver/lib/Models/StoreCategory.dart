import 'package:apollodeliver/Models/Image.dart';
import 'package:apollodeliver/Models/Product.dart';
import 'package:apollodeliver/Models/Store.dart';
import 'package:apollodeliver/Models/Video.dart';

class StoreCategory {
  int? id;
  String? name;
  String? heroImage;
  String? squareImage;
  Store? store;
  StoreCategory? parentStoreCategory;
  List<Product>? productList;
  List<Image>? imageList;
  List<Video>? videoList;

  StoreCategory({this.id, this.name, this.heroImage, this.squareImage, this.store, this.parentStoreCategory, this.productList, this.imageList, this.videoList});
}