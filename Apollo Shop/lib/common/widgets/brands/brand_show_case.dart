import 'package:apolloshop/common/widgets/brands/brand_card.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:apolloshop/common/widgets/layouts/grid_layout.dart';
import 'package:apolloshop/common/widgets/shimmers/store_shimmer.dart';
import 'package:apolloshop/features/shop/controllers/store/store_controller.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final storeController = Get.put(StoreController());
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          Obx(() {
            if (storeController.isLoading.value) {
              return const StoreShimmer();
            }
            return GridLayout(
              itemCount: storeController.featuredStores.length,
              mainAxisExtent: 80,
              itemBuilder: (_, index) {
                final store = storeController.featuredStores[index];
                final productCount =
                    storeController.productsCountByStore[store.id] ?? 0;
                return StoreCard(
                  store: store,
                  showBorder: false,
                  productCount: productCount, // Pass productCount
                );
              },
            );
          }),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Brand Top 3 Products img
          Row(
            children: images
                .map((e) => brandTopProductImageWidget(e, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
