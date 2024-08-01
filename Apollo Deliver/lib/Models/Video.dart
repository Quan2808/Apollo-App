import 'package:apollodeliver/Models/StoreCategory.dart';
import 'package:apollodeliver/Models/Variant.dart';

class Video {
  int? id;
  String? videoPath;
  Variant? variant;
  StoreCategory? storeCategory;

  Video({this.id, this.videoPath, this.variant, this.storeCategory});
}