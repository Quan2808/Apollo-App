import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/features/personalization/controllers/address/address_controller.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = AddressController.instance;
    return Scaffold(
      appBar: const ApolloAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: ctrl.street,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.building),
                    labelText: 'Address',
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                ElevatedButton(
                  onPressed: () async {
                    // Call the method to add a new address
                    await ctrl.addNewAddress();
                  },
                  child: const Text('Save Address'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
