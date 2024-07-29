import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/appbar/tabbar.dart';
import 'package:apolloshop/common/widgets/brands/brand_card.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:apolloshop/common/widgets/layouts/grid_layout.dart';
import 'package:apolloshop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        /// App bar
        appBar: ApolloAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [CartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          /// Header
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

                    /// Brand GRID
                    GridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return const BrandCard(
                          showBorder: false,
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// Tabs
              bottom: const ApolloTabBar(
                tabs: [
                  Tab(child: Text('Category Tab')),
                  Tab(child: Text('Category Tab')),
                  Tab(child: Text('Category Tab')),
                  Tab(child: Text('Category Tab')),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
