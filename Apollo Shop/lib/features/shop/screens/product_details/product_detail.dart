import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/data/models/product/product_model.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/product_detail_rating.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:apolloshop/features/shop/screens/product_previews/product_previews.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const ProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating
                  const ProductDetailRating(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Price, Title Stock & Brand
                  const ProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Attribute
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  const SectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                          title: 'Reviews', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () =>
                            Get.to(() => const ProductPreviewsScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
