import 'package:apolloshop/common/widgets/icons/circular_icon.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityAdjuster extends StatelessWidget {
  const ProductQuantityAdjuster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        const SizedBox(width: 70),
        Row(
          children: [
            CircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkerGrey
                  : TColors.light,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('2', style: theme.titleSmall),
            const SizedBox(width: TSizes.spaceBtwItems),
            const CircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: TColors.white,
              backgroundColor: TColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
