import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/services/order/order_service.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final OrderService _orderService = Get.find<OrderService>();

  final RxList<OrderModel> _userOrders = <OrderModel>[].obs;
  List<OrderModel> get userOrders => _userOrders;

  Future<void> fetchUserOrders() async {
    final userId = UserController.instance.user.value!.id;
    final orders = await _orderService.getOrders(userId);
    _userOrders.assignAll(orders);
  }

  Future<List<OrderModel>> createOrder(
      List<Map<String, dynamic>> orders) async {
    final createdOrders = await _orderService.createOrder(orders);
    _userOrders.addAll(createdOrders);
    return createdOrders;
  }
}
