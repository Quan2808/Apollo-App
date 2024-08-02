import 'dart:convert';

import 'package:apolloshop/data/models/user_model.dart';
import 'package:apolloshop/data/services/authentication/authentication_service.dart';
import 'package:apolloshop/features/authentication/screens/login/login.dart';
import 'package:apolloshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final AuthenticationService _authService =
      AuthenticationService(ApiConstants.baseApiUrl);
  final deviceStorage = GetStorage();

  final _secureStorage = const FlutterSecureStorage();
  final Rx<UserModel?> _currentUser = Rx<UserModel?>(null);
  final RxString accessToken = ''.obs;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final storedUser = await _secureStorage.read(key: 'user');
    final storedToken = await _secureStorage.read(key: 'accessToken');
    if (storedUser != null && storedToken != null) {
      try {
        _currentUser.value = UserModel.fromJson(jsonDecode(storedUser));
        accessToken.value = storedToken;
        Get.offAll(() => const NavigationMenu());
      } catch (e) {
        await signOut();
      }
    } else {
      bool isFirstTime = deviceStorage.read('firstStartUp') ?? true;
      if (isFirstTime) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        // Get.offAll(() => const OnBoardingScreen());

        Get.offAll(() => const LoginScreen());
      }
    }
  }

  /* ----------------------- AUTHENTICATION ----------------------- */

  // Sign In
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.signIn(
        email: email,
        password: password,
      );

      // Save accessToken
      accessToken.value = response['accessToken'];
      await _secureStorage.write(key: 'accessToken', value: accessToken.value);

      // Fetch user info using the token
      await _fetchUserInfo();

      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      if (kDebugMode) {
        print('====================== BEGIN PROBLEMS ======================');
        print(e.toString());
        print('====================== END PROBLEMS ======================');
      }
      rethrow;
    }
  }

  // Register
  Future<void> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      await _authService.signUp(
        clientName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Sign Out
  Future<void> signOut() async {
    _currentUser.value = null;
    accessToken.value = '';

    // Clear stored user and token
    await _secureStorage.delete(key: 'user');
    await _secureStorage.delete(key: 'accessToken');

    deviceStorage.write('firstStartUp', false);
    Get.offAll(() => const LoginScreen());
  }

  Future<void> _fetchUserInfo() async {
    try {
      final userInfo = await _authService.fetchUserInfo(accessToken.value);
      _currentUser.value = userInfo;
      await _secureStorage.write(key: 'user', value: jsonEncode(_currentUser.value!.toJson()));
    } catch (e) {
      if (kDebugMode) {
        print('====================== BEGIN PROBLEMS ======================');
        print(e.toString());
        print('====================== END PROBLEMS ======================');
      }
      rethrow;
    }
  }

  UserModel? get currentUser => _currentUser.value;

  Future<bool> get isSignedIn async =>
      await _secureStorage.read(key: 'accessToken') != null;
}
