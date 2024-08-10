import 'package:apolloshop/data/services/cart/cart_service.dart';
import 'package:get/get.dart';

class CartRepository extends GetxController {
  static CartRepository get instance => Get.find();

  final CartService _cartService = Get.find<CartService>();

  Future<void> postCart({
    required String clientName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    await _cartService.postCart(
      clientName: clientName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}
