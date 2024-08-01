import 'package:apollodeliver/Models/Admin.dart';
import 'package:apollodeliver/Models/Review.dart';

class Comment {
  int? id;
  String? content;
  Review? review;
  Admin? admin;

  Comment({this.id, this.content, this.review, this.admin});
}