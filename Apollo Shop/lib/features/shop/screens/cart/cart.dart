import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:apolloshop/features/shop/screens/checkout/checkout.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: ApolloAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        // Items in Cart
        child: CartItems(),
      ),

      // Checkout
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$25'),
        ),
      ),
    );
  }
}
