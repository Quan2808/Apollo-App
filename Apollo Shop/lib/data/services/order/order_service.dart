import 'dart:convert';

import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderService extends GetxService {
  static OrderService get instance => Get.find();

  final String baseUrl = ApiConstants.baseApiUrl;

  Future<List<OrderModel>> getOrders(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/payments/shop-order/user/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load orders. Status code: ${response.statusCode}');
      }

      if (response.body.isEmpty) {
        return [];
      }

      List<dynamic> ordersJson = jsonDecode(response.body);

      return ordersJson
          .map((orderJson) => OrderModel.fromSnapshot(orderJson))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<OrderModel>> createOrder(
      List<Map<String, dynamic>> orders) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/payments/process-order'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orders),
      );
      if (response.statusCode != 201) {
        throw Exception(
            'Failed to create order. Status code: ${response.statusCode}');
      }

      List<dynamic> ordersJson = jsonDecode(response.body);
      return ordersJson
          .map((orderJson) => OrderModel.fromSnapshot(orderJson))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
