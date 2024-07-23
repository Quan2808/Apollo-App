import 'dart:core';

import 'package:apolloshop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:apolloshop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:apolloshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const PrimaryHeaderContainer(
                child: Column(
              children: [
                /// Appbar
                HomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),

                /// Search bar
                SearchContainer(text: 'Search in Store'),
                SizedBox(height: TSizes.spaceBtwSections),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// Heading
                      SectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// Categories
                      HomeCategories(),
                    ],
                  ),
                )
              ],
            )),

            /// Body
            Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: PromoSlider(
                  banners: [TImages.promoBanner1, TImages.promoBanner3],
                ))
          ],
        ),
      ),
    );
  }
}
