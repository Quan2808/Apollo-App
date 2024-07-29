import 'package:apolloshop/common/widgets/image_text/vertical_image_text.dart';
import 'package:apolloshop/features/shop/screens/sub_category/sub_categories.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageText(
              title: 'Category',
              image: TImages.shoeIcon,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          }),
    );
  }
}
