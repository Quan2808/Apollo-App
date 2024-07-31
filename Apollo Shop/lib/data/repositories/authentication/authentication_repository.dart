import 'package:apolloshop/data/services/authentication_service.dart';
import 'package:apolloshop/features/authentication/screens/login/login.dart';
import 'package:apolloshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final AuthenticationService _authService =
      AuthenticationService(ApiConstants.baseApiUrl);
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* ----------------------- AUTHENTICATION ----------------------- */

  // Register

  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      await _authService.register(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
}
