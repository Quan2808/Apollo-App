import 'package:apollodeliver/Models/CartLine.dart';
import 'package:apollodeliver/Models/Image.dart';
import 'package:apollodeliver/Models/OptionValue.dart';
import 'package:apollodeliver/Models/Product.dart';
import 'package:apollodeliver/Models/Review.dart';
import 'package:apollodeliver/Models/SaveForLater.dart';
import 'package:apollodeliver/Models/ShopOrder.dart';
import 'package:apollodeliver/Models/Video.dart';

class Variant {
  int? id;
  String? name;
  String? skuCode;
  int? stockQuantity;
  double? weight;
  double? price;
  double? salePrice;
  String? img;
  bool? isDeleted;
  Product? product;
  List<Image>? images;
  List<Video>? videos;
  List<OptionValue>? optionValues;
  CartLine? cartLine;
  SaveForLater? saveForLater;
  List<Review>? reviews;
  Set<ShopOrder>? shopOrders;

  Variant({this.id, this.name, this.skuCode, this.stockQuantity, this.weight, this.price, this.salePrice, this.img, this.isDeleted, this.product, this.images, this.videos, this.optionValues, this.cartLine, this.saveForLater, this.reviews, this.shopOrders});
}