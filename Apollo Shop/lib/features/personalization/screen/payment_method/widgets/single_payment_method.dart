import 'package:apolloshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:apolloshop/data/models/payment_method/payment_method_model.dart';
import 'package:apolloshop/features/personalization/controllers/payment_method/payment_method_controller.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinglePaymentMethod extends StatelessWidget {
  const SinglePaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.onTap,
  });

  final PaymentMethodModel paymentMethod;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final ctrl = PaymentMethodController.instance;

    return Obx(() {
      final selectedPaymentMethodId = ctrl.selectedPaymentMethod.value.id;
      final isSelected = selectedPaymentMethodId == paymentMethod.id;

      return InkWell(
        onTap: onTap,
        child: RoundedContainer(
          width: double.infinity,
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: isSelected ? TColors.primary : Colors.transparent,
          borderColor: isSelected
              ? TColors.primary
              : darkMode
                  ? TColors.darkerGrey
                  : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentMethod.cardNumber.toString(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                softWrap: true,
              ),
              const SizedBox(height: TSizes.sm / 2),
              if (paymentMethod.nameOnCard != null)
                Text(
                  paymentMethod.nameOnCard!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.white70 : Colors.black54,
                      ),
                ),
              if (paymentMethod.expirationDate != null)
                Text(
                  paymentMethod.expirationDate!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.white70 : Colors.black54,
                      ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
