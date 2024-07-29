import 'package:apollodeliver/Models/Cart.dart';
import 'package:apollodeliver/Models/Variant.dart';

class SaveForLater {
  int? id;
  int? quantity;
  Cart? cart;
  Variant? variant;

  SaveForLater({this.id, this.quantity, this.cart, this.variant});
}