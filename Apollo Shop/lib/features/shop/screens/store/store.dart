import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:apolloshop/common/widgets/images/circular_image.dart';
import 'package:apolloshop/common/widgets/layouts/grid_layout.dart';
import 'package:apolloshop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:apolloshop/common/widgets/texts/brands/brand_title_with_verified_icon.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/enums.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ApolloAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CartCounterIcon(
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: dark ? TColors.black : TColors.white,
            expandedHeight: 440,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  /// Search
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SearchContainer(
                    text: 'Search in Store',
                    showBorder: true,
                    showBackground: false,
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Featured Brands
                  SectionHeading(title: 'Featured Brands', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                  GridLayout(
                    itemCount: 4,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: RoundedContainer(
                          padding: const EdgeInsets.all(TSizes.sm),
                          showBorder: true,
                          backgroundColor: Colors.transparent,
                          child: Row(
                            children: [
                              /// Icon
                              Flexible(
                                child: CircularImage(
                                  isNetworkImage: false,
                                  imageUrl: TImages.clothIcon,
                                  backgroundColor: Colors.transparent,
                                  overlayColor:
                                      dark ? TColors.white : TColors.black,
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),

                              /// Text
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const BrandTitleWithVerifiedIcon(
                                      title: 'Brand',
                                      textSize: TextSizes.large,
                                    ),
                                    Text(
                                      /// Product quantity
                                      'x products',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Container(),
      ),
    );
  }
}
