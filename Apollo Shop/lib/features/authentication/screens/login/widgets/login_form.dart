import 'package:apolloshop/features/authentication/screens/signup/signup.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:apolloshop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          // const SizedBox(
          //   height: TSizes.spaceBtwInputFields / 2,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextButton(
          //         onPressed: () {}, child: const Text(TTexts.forgetPassword))
          //   ],
          // ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(TTexts.signIn)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    ));
  }
}
