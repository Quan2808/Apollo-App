import 'package:apollodeliver/Models/Address.dart';
import 'package:apollodeliver/Models/Comment.dart';
import 'package:apollodeliver/Models/Store.dart';

class Admin {
  int? id;
  String? adminName;
  String? email;
  String? password;
  double? balance;
  String? role;
  Set<Address>? address;
  List<Store>? storeList;
  List<Comment>? storeComments;

  Admin({this.id, this.adminName, this.email, this.password, this.balance, this.role, this.address, this.storeList, this.storeComments});
}