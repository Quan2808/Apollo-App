import 'package:apolloshop/common/widgets/images/rounded_image.dart';
import 'package:apolloshop/common/widgets/texts/brands/brand_title_with_verified_icon.dart';
import 'package:apolloshop/common/widgets/texts/products/product_attribute_text.dart';
import 'package:apolloshop/common/widgets/texts/products/product_title_text.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        RoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title, Attribute & Price
        const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: 'Brand'),
              Flexible(
                child: ProductTitleText(title: 'Product name', maxLines: 1),
              ),
              Flexible(
                child: ProductAttributeText(title: 'Variant'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
