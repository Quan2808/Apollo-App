import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:apolloshop/common/widgets/list_title/settings_menu_title.dart';
import 'package:apolloshop/common/widgets/list_title/user_profile_title.dart';
import 'package:apolloshop/common/widgets/texts/section_heading.dart';
import 'package:apolloshop/features/personalization/screen/address/address.dart';
import 'package:apolloshop/features/personalization/screen/profile/profile.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  ApolloAppBar(
                    title: Text(
                      'Account',
                      style: theme.headlineMedium!.apply(
                        color: TColors.white,
                      ),
                    ),
                  ),

                  /// User Profile
                  UserProfileTitle(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Setting
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Settings menu
                  SettingsMenuTitle(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const SettingsMenuTitle(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                  ),
                  const SettingsMenuTitle(
                    icon: Iconsax.clipboard_text,
                    title: 'My Orders',
                    subtitle: 'In-Process and Completed Orders',
                  ),

                  /// Logout button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
