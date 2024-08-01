import 'package:apollodeliver/Models/OptionTable.dart';
import 'package:apollodeliver/Models/Variant.dart';

class OptionValue {
  int? id;
  String? value;
  OptionTable? optionTable;
  List<Variant>? variants;

  OptionValue({this.id, this.value, this.optionTable, this.variants});
}