import 'package:apolloshop/common/widgets/products/cart/cart_item.dart';
import 'package:apolloshop/common/widgets/products/cart/product_quantity_adjuster.dart';
import 'package:apolloshop/common/widgets/texts/products/product_price_text.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAdjustButton = true,
  });

  final bool showAdjustButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, index) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          // Individual cart item widget
          const CartItem(),
          if (showAdjustButton) const SizedBox(height: TSizes.spaceBtwItems),

          // Adjust the quantity & display the price of the product
          if (showAdjustButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Widget to adjust the quantity of the product
                ProductQuantityAdjuster(),
                // Widget to display the price of the product
                ProductPriceText(price: '25'),
              ],
            ),
        ],
      ),
    );
  }
}
