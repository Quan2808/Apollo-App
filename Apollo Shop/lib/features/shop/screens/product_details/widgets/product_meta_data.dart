import 'package:apolloshop/common/widgets/images/circular_image.dart';
import 'package:apolloshop/common/widgets/texts/brands/brand_title_with_verified_icon.dart';
import 'package:apolloshop/common/widgets/texts/products/product_price_text.dart';
import 'package:apolloshop/common/widgets/texts/products/product_title_text.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/enums.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price
        const Row(
          children: [
            ProductPriceText(
              price: '123',
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitleText(title: 'Product name'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              imageUrl: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const BrandTitleWithVerifiedIcon(
              title: 'Brand',
              textSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
