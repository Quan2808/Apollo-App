import 'package:apolloshop/common/widgets/layouts/grid_layout.dart';
import 'package:apolloshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:apolloshop/data/models/category/category_model.dart';
import 'package:apolloshop/data/models/store/store_model.dart';
import 'package:apolloshop/features/shop/controllers/product/product_controller.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    this.store,
  });

  final StoreModel? store;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;

    // Filter products based on the store passed
    if (store != null) {
      productController.filterByStore(store!);
    }

    return Obx(() {
      return Column(
        children: [
          // Dropdown for sort
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
            ),
            hint: const Text('Sort by'), // Placeholder text
            onChanged: (value) {
              if (value != null) {
                productController.sortProducts(value);
              }
            },
            items: [
              'Name Ascending',
              'Name Descending',
            ]
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Dropdown for category filter
          DropdownButtonFormField<CategoryModel>(
            isExpanded: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.category),
            ),
            hint: const Text('Select Category'), // Placeholder text
            onChanged: (CategoryModel? category) {
              if (category != null) {
                productController.filterByCategory(category);
              }
            },
            items: [
              const DropdownMenuItem<CategoryModel>(
                value: null,
                child: Text('All Categories'),
              ),
              ...productController.filteredCategories.map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.attribute),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Search Field
          Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: TextField(
              onChanged: (value) {
                productController.filterByName(value);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Products
          GridLayout(
            mainAxisExtent: 271,
            itemCount: productController.filteredProducts.isEmpty
                ? productController.products.length
                : productController.filteredProducts.length,
            itemBuilder: (_, index) => ProductCardVertical(
              product: productController.filteredProducts.isEmpty
                  ? productController.products[index]
                  : productController.filteredProducts[index],
            ),
          ),
        ],
      );
    });
  }
}
