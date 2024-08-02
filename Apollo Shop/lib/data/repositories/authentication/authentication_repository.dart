import 'package:apolloshop/data/repositories/user/user_repository.dart';
import 'package:apolloshop/data/services/authentication/authentication_service.dart';
import 'package:apolloshop/features/authentication/screens/login/login.dart';
import 'package:apolloshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:apolloshop/utils/helpers/helper_exception.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final AuthenticationService _authService =
  AuthenticationService(ApiConstants.baseApiUrl);
  final deviceStorage = GetStorage();
  final _secureStorage = const FlutterSecureStorage();

  // Create an instance of UserRepository
  late final UserRepository _userRepository;

  @override
  void onInit() {
    super.onInit();
    _userRepository = UserRepository(_authService, _secureStorage);
  }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    try {
      final storedUser = await _secureStorage.read(key: 'user');
      final storedToken = await _secureStorage.read(key: 'accessToken');
      if (storedUser != null && storedToken != null) {
        _userRepository.accessToken.value = storedToken;
        await _userRepository.fetchUserInfo();
        Get.offAll(() => const NavigationMenu());
      } else {
        bool isFirstTime = deviceStorage.read('firstStartUp') ?? true;
        if (isFirstTime) {
          Get.offAll(() => const OnBoardingScreen());
        } else {
          Get.offAll(() => const LoginScreen());
        }
      }
    } catch (e) {
      await signOut();
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

      _userRepository.accessToken.value = response['accessToken'];
      await _secureStorage.write(key: 'accessToken', value: _userRepository.accessToken.value);

      await _userRepository.fetchUserInfo();
    } catch (e) {
      throw HelperException.getLoginException(e.toString());
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
    await _userRepository.signOut();
    deviceStorage.write('firstStartUp', false);
    Get.offAll(() => const LoginScreen());
  }
}
