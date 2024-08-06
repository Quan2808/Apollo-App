import 'package:apolloshop/data/models/product/variant_model.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.variant,
  });

  final VariantModel variant;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        final cartItem = cartController.convertVariantToCartLine(variant, 1);
        cartController.addAnItemToCart(cartItem);
      },
      child: Obx(
            () {
          final productQuantityInCart =
          cartController.getProductQuantityInCart(variant.id);
          return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? TColors.primary : TColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusMd),
                bottomRight: Radius.circular(TSizes.productImageRadius),
              ),
            ),
            child: SizedBox(
              width: TSizes.iconLg * 1.2,
              height: TSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                  productQuantityInCart.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.white),
                )
                    : const Icon(Iconsax.add, color: TColors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
