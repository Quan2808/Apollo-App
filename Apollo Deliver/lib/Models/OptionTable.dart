import 'package:apollodeliver/Models/OptionValue.dart';
import 'package:apollodeliver/Models/Product.dart';

class OptionTable {
  int? id;
  String? name;
  List<OptionValue>? optionValues;
  Product? product;

  OptionTable({this.id, this.name, this.optionValues, this.product});
}