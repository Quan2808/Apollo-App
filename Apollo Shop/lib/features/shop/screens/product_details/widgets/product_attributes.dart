import 'package:apolloshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:apolloshop/common/widgets/images/rounded_image.dart';
import 'package:apolloshop/common/widgets/texts/products/product_price_text.dart';
import 'package:apolloshop/common/widgets/texts/products/product_title_text.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Select Attributes Pricing & Description
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: const Column(
            children: [
              /// Title & Price
              Row(
                children: [
                  SectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                  ProductTitleText(title: 'Price: ', smallSize: true),
                  Row(
                    children: [ProductPriceText(price: '20')],
                  ),
                ],
              ),

              ProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to more than 100 characters and max 4 lines.',
                maxLines: 4,
                smallSize: true,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Attributes
        Positioned(
          right: 0,
          bottom: 30,
          left: TSizes.defaultSpace,
          child: SizedBox(
            height: 80,
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              itemBuilder: (_, index) => RoundedImage(
                width: 80,
                backgroundColor: dark ? TColors.black : TColors.white,
                border: Border.all(color: TColors.primary),
                padding: const EdgeInsets.all(TSizes.sm),
                imageUrl: TImages.productImage2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
