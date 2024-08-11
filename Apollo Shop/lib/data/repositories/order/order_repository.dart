import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/services/order/order_service.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final OrderService _orderService = Get.find<OrderService>();

  final Rx<OrderModel?> _currentCart = Rx<OrderModel?>(null);
  OrderModel? get currentCart => _currentCart.value;

  Future<void> fetchUserOrders() async {
    final userId = UserController.instance.user.value!.id;
    final orderData = await _orderService.getShopOrder(userId);
    if (orderData != null) {
      _currentCart.value = OrderModel.fromSnapshot(orderData);
    } else {
      _currentCart.value = null;
    }
  }
}
