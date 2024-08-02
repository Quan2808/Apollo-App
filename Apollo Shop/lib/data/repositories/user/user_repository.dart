import 'dart:convert';

import 'package:apolloshop/data/models/user_model.dart';
import 'package:apolloshop/data/services/authentication/authentication_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  final AuthenticationService _authService;
  final FlutterSecureStorage _secureStorage;

  UserRepository(this._authService, this._secureStorage);

  final Rx<UserModel?> _currentUser = Rx<UserModel?>(null);
  final RxString accessToken = ''.obs;

  UserModel? get currentUser => _currentUser.value;

  Future<void> fetchUserInfo() async {
    try {
      final userInfo = await _authService.fetchUserInfo(accessToken.value);
      _currentUser.value = userInfo;
      await _secureStorage.write(key: 'user', value: jsonEncode(_currentUser.value!.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    _currentUser.value = null;
    accessToken.value = '';

    await _secureStorage.delete(key: 'user');
    await _secureStorage.delete(key: 'accessToken');
  }
}