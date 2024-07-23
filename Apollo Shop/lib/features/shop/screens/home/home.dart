import 'dart:core';

import 'package:apolloshop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:apolloshop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:apolloshop/utils/constants/colors.dart';
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
            PrimaryHeaderContainer(
                child: Column(
              children: [
                HomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),
                SearchContainer(text: 'Search in Store'),
                SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      SectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      HomeCategories(),
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
