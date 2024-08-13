import 'dart:convert';

import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/repositories/user/user_repository.dart';
import 'package:apolloshop/data/request/order/order_request.dart';
import 'package:apolloshop/data/services/authentication/authentication_service.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderService extends GetxService {
  static OrderService get instance => Get.find();

  final String baseUrl = ApiConstants.baseApiUrl;

  final AuthenticationService _authService =
      AuthenticationService(ApiConstants.baseApiUrl);

  final _secureStorage = const FlutterSecureStorage();
  late final UserRepository _userRepository;

  @override
  void onInit() {
    super.onInit();
    _userRepository = UserRepository(_authService, _secureStorage);
  }

  Future<List<OrderModel>> getOrders(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/payments/orders/$userId'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      final List decodedJson = jsonDecode(response.body);
      return decodedJson.map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load orders: $e');
    }
  }

  Future<List<OrderModel>> createOrder(List<OrderRequest> orders) async {
    try {
      _userRepository.initializeUser();
      final response = await http.post(
        Uri.parse('$baseUrl/payments'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_userRepository.accessToken.value}',
        },
        body: jsonEncode(orders.map((order) => order.toJson()).toList()),
      );

      if (kDebugMode) {
        print('============== Begin Response to server ===================');
        print('Access Token: ${_userRepository.accessToken.value}');
        print('Response status: ${response.statusCode}');
        print(
            'Request body: ${jsonEncode(orders.map((order) => order.toJson()).toList())}');
        print('============== End Response to server ===================');
      }

      final List decodedJson = jsonDecode(response.body);
      return decodedJson.map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('============== Begin Error to create ===================');
        print(e.toString());
        print('============== End Error to create ===================');
      }
      throw Exception('Failed to create order: ${e.toString()}');
    }
  }
}
