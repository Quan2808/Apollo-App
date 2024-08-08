import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/loaders/animation_loader.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:apolloshop/features/shop/screens/checkout/checkout.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      // AppBar
      appBar: ApolloAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(
        () {
          final emptyWidget = AnimationLoaderWidget(
            text: 'Whoops! Cart is Empty',
            animation: TImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          return controller.cartItems.isEmpty
              ? emptyWidget
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    // Items in Cart
                    child: CartItems(),
                  ),
                );
        },
      ),

      // Checkout
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(
                  () => Text(
                    'Checkout \$${controller.totalCartPrice.value.toStringAsFixed(1)}',
                  ),
                ),
              ),
            ),
    );
  }
}
