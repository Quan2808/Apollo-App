import 'package:apolloshop/common/widgets/brands/brand_show_case.dart';
import 'package:apolloshop/common/widgets/layouts/grid_layout.dart';
import 'package:apolloshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/data/models/product/category_model.dart';
import 'package:apolloshop/features/shop/controllers/product_controller.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final products = ProductController.instance.products;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const BrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              SectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              GridLayout(
                mainAxisExtent: 271,
                itemCount: products.length,
                itemBuilder: (_, index) => ProductCardVertical(
                  product: products[index],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
