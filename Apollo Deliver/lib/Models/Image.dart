import 'package:apollodeliver/Models/StoreCategory.dart';
import 'package:apollodeliver/Models/Variant.dart';

class Image {
  int? id;
  String? imgPath;
  Variant? variant;
  StoreCategory? storeCategory;

  Image({this.id, this.imgPath, this.variant, this.storeCategory});
}