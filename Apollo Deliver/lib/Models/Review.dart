import 'package:apollodeliver/Models/Comment.dart';
import 'package:apollodeliver/Models/User.dart';
import 'package:apollodeliver/Models/Variant.dart';

class Review {
  int? id;
  int? star;
  String? title;
  String? content;
  String? image01;
  String? image02;
  String? image03;
  String? image04;
  String? image05;
  String? video;
  bool? verifiedShop;
  bool? verifiedAdmin;
  DateTime? createAt;
  DateTime? updateAt;
  User? customer;
  User? shipper;
  Variant? variant;
  List<Comment>? commentList;

  Review({this.id, this.star, this.title, this.content, this.image01, this.image02, this.image03, this.image04, this.image05, this.video, this.verifiedShop, this.verifiedAdmin, this.createAt, this.updateAt, this.customer, this.shipper, this.variant, this.commentList});
}