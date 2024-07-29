import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/layouts/grid_layout.dart';
import 'package:apolloshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // App bar
        appBar: const ApolloAppBar(
          title: Text('Popular Products'),
          showBackArrow: true,
        ),

        // Body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Drop down
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  onChanged: (value) {},
                  items: ['Name', 'Higher Price', 'Lower Price']
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Products
                GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical()),
              ],
            ),
          ),
        ));
  }
}
