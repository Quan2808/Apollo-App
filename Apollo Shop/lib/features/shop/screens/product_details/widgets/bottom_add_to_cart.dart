import 'package:apolloshop/common/widgets/icons/circular_icon.dart';
import 'package:apolloshop/data/models/product/variant_model.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({
    super.key,
    required this.variant,
  });

  final VariantModel variant;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    // controller.updateAlreadyAddedProductCount(variant);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () => controller.productQuantityInCart.value < 1
                    ? null
                    : controller.productQuantityInCart.value -= 1,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                controller.productQuantityInCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              CircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () => controller.productQuantityInCart.value += 1,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
