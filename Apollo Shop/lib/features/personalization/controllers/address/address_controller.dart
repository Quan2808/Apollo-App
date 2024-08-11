import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/address/address_model.dart';
import 'package:apolloshop/data/repositories/address/address_repository.dart';
import 'package:apolloshop/features/personalization/controllers/user/user_controller.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:apolloshop/utils/constants/image_strings.dart';
import 'package:apolloshop/utils/helpers/network_manager.dart';
import 'package:apolloshop/utils/popups/full_screen_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  // Variables
  final street = TextEditingController();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  RxList<String> suggestions = <String>[].obs;
  RxString selectedAddressText = ''.obs;
  RxString distance = ''.obs;

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

      if (street.text.isEmpty) {
        TFullScreenLoader.stopLoading();
        return;
      }

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

      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (e) => e.selectedAddress,
        orElse: () => AddressModel.empty(),
      );

      street.clear();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Address Not Added', message: e.toString());
    }
  }

  void autosuggest(String text) async {
    const String apiKey = ApiConstants.map4dApiKey;
    final String url =
        'http://api.map4d.vn/sdk/autosuggest?key=$apiKey&text=$text&location=10.762622,106.660172&acronym=false';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<String> results =
            List<String>.from(data['result'].map((item) => item['address']));
        suggestions.value = results;
      } else {
        throw Exception('Failed to load suggestions. Please try again later.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching suggestions: $e');
      }
    }
  }

  void calculateDistance(String destination) async {
    const String apiKey = ApiConstants.map4dApiKey;
    const String origin = '10.762622,106.660172';
    final String url =
        'http://api.map4d.vn/sdk/route?key=$apiKey&origin=$origin&destination=$destination&mode=car';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result']['routes'].length > 0) {
          final route = data['result']['routes'][0];
          final String distance = route['legs'][0]['distance']['text'];
          this.distance.value = distance;
        } else {
          distance.value =
              "Unable to calculate distance. Please try again later.";
        }
      } else {
        throw Exception(
            'Failed to calculate distance. Please try again later.');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error calculating distance: $error');
      }
      distance.value = "Unable to calculate distance";
    }
  }
}
