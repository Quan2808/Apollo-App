import 'package:apolloshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    final ctrl = Get.put(CheckoutController());

    return Column(
      children: [
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => ctrl.setPaymentMethod(context),
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              RoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: Image(
                  image: AssetImage(ctrl.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(ctrl.selectedPaymentMethod.value.name,
                  style: theme.bodyLarge)
            ],
          ),
        ),
      ],
    );
  }
}
