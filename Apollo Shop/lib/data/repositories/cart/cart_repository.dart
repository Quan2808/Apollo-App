import 'package:apolloshop/data/models/cart/cart_model.dart';
import 'package:apolloshop/data/services/cart/cart_service.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:get/get.dart';

class CartRepository extends GetxService {
  static CartRepository get instance => Get.find();

  final CartService _cartService = Get.find<CartService>();

  final Rx<CartModel?> _currentCart = Rx<CartModel?>(null);

  CartModel? get currentCart => _currentCart.value;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentCart();
  }

  // Fetch the current cart for the user.
  Future<void> fetchCurrentCart() async {
    final userId = UserController.instance.user.value!.id;
    final cartData = await _cartService.getCart(userId: userId);
    if (cartData != null) {
      _currentCart.value = CartModel.fromJson(cartData);
    } else {
      _currentCart.value = null;
    }
  }
}
