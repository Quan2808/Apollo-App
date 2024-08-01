import 'package:apolloshop/data/services/authentication/authentication_service.dart';
import 'package:apolloshop/features/authentication/screens/login/login.dart';
import 'package:apolloshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final AuthenticationService _authService =
      AuthenticationService(ApiConstants.baseApiUrl);
  final deviceStorage = GetStorage();
  // UserModel? _currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    // final user = currentUser;
    // if (user != null) {
    //   if (user.enabled) {
    //     Get.offAll(() => const NavigationMenu());
    //   } else {
    //     Get.offAll(() => const LoginScreen());
    //   }
    // } else {
    //   Get.offAll(() => const OnBoardingScreen());
    // }

    deviceStorage.writeIfNull('firstStartUp', true);
    deviceStorage.read('firstStartUp') != true
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
  // Future<void> signOut() async {
  //   // try {
  //   //   await _authService.signOut();
  //   //   Get.offAll(() => const LoginScreen());
  //   //   _currentUser = null;
  //   // } catch (e) {
  //   //   throw 'Something went wrong. Please try again';
  //   // }
  // }
  //
  // UserModel? get currentUser => _currentUser;
  //
  // Future<bool> get isSignedIn async => _currentUser != null;
}
