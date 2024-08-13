import 'package:apolloshop/data/models/shipping_method/shipping_method_model.dart';
import 'package:get/get.dart';

class ShippingMethodController extends GetxController {
  static ShippingMethodController get instance => Get.find();

  final Rx<ShippingMethodModel> selectedShippingMethod =
      ShippingMethodModel.empty().obs;
}
