import 'package:apollodeliver/Models/Cart.dart';
import 'package:apollodeliver/Models/Variant.dart';

class CartLine {
  int? id;
  int? quantity;
  Cart? cart;
  Variant? variant;

  CartLine({this.id, this.quantity, this.cart, this.variant});
}