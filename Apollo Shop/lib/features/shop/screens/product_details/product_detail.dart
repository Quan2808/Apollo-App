import 'package:apolloshop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/product_detail_rating.dart';
import 'package:apolloshop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating
                  ProductDetailRating(),
                  SizedBox(height: TSizes.spaceBtwItems / 1.5),

                  /// Price, Title Stock & Brand
                  ProductMetaData(),

                  /// Attribute
                  /// Checkout Button
                  /// Description
                  /// Review
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
