import 'package:apollodeliver/Models/CartLine.dart';
import 'package:apollodeliver/Models/SaveForLater.dart';
import 'package:apollodeliver/Models/User.dart';

class Cart {
  int? id;
  User? user;
  List<CartLine>? cartLines;
  List<SaveForLater>? saveForLaterList;

  Cart({this.id, this.user, this.cartLines, this.saveForLaterList});
}