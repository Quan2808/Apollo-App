import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/repositories/order/order_repository.dart';
import 'package:apolloshop/features/personalization/controllers/address/address_controller.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartCtrl = CartController.instance;
  final addressCtrl = AddressController.instance;
  final checkoutCtrl = CheckoutController.instance;
  final orderRepo = Get.put(OrderRepository());

  // Fetch user's orders
  // Future<List<OrderModel>> fetchUserOrders() async {
  //   try {
  //     return orderRepo.fetchUserOrders();
  //   } catch (e) {
  //     Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
  //     return [];
  //   }
  // }
}
