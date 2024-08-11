import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/address/address_model.dart';
import 'package:apolloshop/data/repositories/address/address_repository.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/helpers/network_manager.dart';
import 'package:apolloshop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  // Variables
  final street = TextEditingController();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  RxBool refreshData = true.obs;

  // Fetch all user addresses
  Future<List<AddressModel>> getUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (e) => e.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
      return [];
    }
  }

  // Add new address
  Future addNewAddress() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Storing Address',
        TImages.docerAnimation,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (street.text.isEmpty) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save address
      final address = AddressModel(
        id: '',
        user: UserController.instance.user.value!,
        street: street.text,
        selectedAddress: true,
      );

      await addressRepository.addNewAddress(address);
      TFullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Address Added',
          message: 'Your address has been saved successfully');

      refreshData.toggle();

      // Refresh addresses
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (e) => e.selectedAddress,
        orElse: () => AddressModel.empty(),
      );

      // Reset form
      street.clear();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Address Not Added', message: e.toString());
    }
  }
}
