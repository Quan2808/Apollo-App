import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/products/cart/cart_item.dart';
import 'package:apolloshop/common/widgets/products/cart/product_quantity_adjuster.dart';
import 'package:apolloshop/common/widgets/texts/products/product_price_text.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApolloAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, index) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (_, index) => const Column(
            children: [
              CartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Add Remove Buttons
                  ProductQuantityAdjuster(),
                  ProductPriceText(price: '25'),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout \$256'),
        ),
      ),
    );
  }
}
