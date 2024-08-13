import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/common/widgets/success_screen/success_screen.dart';
import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/repositories/order/order_repository.dart';
import 'package:apolloshop/data/request/order/order_request.dart';
import 'package:apolloshop/features/personalization/controllers/address/address_controller.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/features/shop/controllers/payment_shipping/payment_method_controller.dart';
import 'package:apolloshop/features/shop/controllers/payment_shipping/shipping_method_controller.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final OrderRepository _orderRepo = OrderRepository.instance;
  final CartController _cartController = CartController.instance;
  final AddressController _addressController = AddressController.instance;
  final PaymentMethodController _paymentMethodController =
      PaymentMethodController.instance;
  final ShippingMethodController _shippingMethodController =
      ShippingMethodController.instance;
  final UserController _userController = UserController.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      await _orderRepo.fetchUserOrders();
      return _orderRepo.userOrders;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<void> processOrder() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.processOrderAnimation);

      final user = _userController.user.value;
      if (user == null) throw Exception('User not logged in');

      final address = _addressController.selectedAddress.value;

      final paymentMethod =
          _paymentMethodController.selectedPaymentMethod.value;

      final shippingMethod =
          _shippingMethodController.selectedShippingMethod.value;

      final orderItems = _cartController.cartItems
          .map((item) => OrderItemRequest(
                variantId: item.variant!.id,
                quantity: item.quantity,
                price: item.variant!.price,
              ))
          .toList();

      final totalAmount =
          _cartController.totalCartPrice.value + shippingMethod.price;

      final orderRequest = OrderRequest(
        userId: user.id,
        orderItems: orderItems,
        orderDate: DateTime.now().toIso8601String(),
        addressId: address.id,
        paymentMethodId: paymentMethod.id ?? 0,
        shippingMethodId: shippingMethod.id,
        orderTotal: totalAmount,
      );

      final createdOrders = await _orderRepo.createOrder([orderRequest]);

      if (createdOrders.isNotEmpty) {
        _cartController.clearCart();
        Get.off(
          () => SuccessScreen(
            image: TImages.applePay,
            title: 'Payment success',
            subTitle: 'Your item will be shipped soon.',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ),
        );
      } else {
        throw Exception('Failed to create order');
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
