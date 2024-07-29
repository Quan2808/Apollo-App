import 'package:apolloshop/common/widgets/image_text/vertical_image_text.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

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
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageText(
                title: 'Shoes', image: TImages.shoeIcon, onTap: () {});
          }),
    );
  }
}
