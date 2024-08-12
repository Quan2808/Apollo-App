import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/common/widgets/success_screen/success_screen.dart';
import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/repositories/order/order_repository.dart';
import 'package:apolloshop/features/personalization/controllers/address/address_controller.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartCtrl = CartController.instance;
  final addressCtrl = AddressController.instance;
  final checkoutCtrl = CheckoutController.instance;
  final orderRepo = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      await orderRepo.fetchUserOrders();
      return orderRepo.userOrders;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<void> processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.processOrderAnimation);

      final user = UserController.instance.user.value;
      if (user == null) return;

      final order = OrderModel(
        id: 0,
        user: user,
        status: 'pending',
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 7)),
        paymentMethod: checkoutCtrl.selectedPaymentMethod.value,
        address: addressCtrl.selectedAddress.value,
        items: cartCtrl.cartItems.toList(),
      );

      final orderMap = order.toJson();

      await orderRepo.createOrder([orderMap]);

      cartCtrl.clearCart();
      Get.off(
        () => SuccessScreen(
          image: TImages.applePay,
          title: 'Payment success',
          subTitle: 'Your item will be shipped soon.',
          onPressed: () => Get.offAll(
            () => const NavigationMenu(),
          ),
        ),
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
