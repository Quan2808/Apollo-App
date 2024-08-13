import 'dart:convert';

import 'package:apolloshop/data/models/order/order_model.dart';
import 'package:apolloshop/data/request/order/order_request.dart';
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderService extends GetxService {
  static OrderService get instance => Get.find();

  final String baseUrl = ApiConstants.baseApiUrl;

  Future<List<OrderModel>> getOrders(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/payments/orders/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return (response as List)
          .map((json) => OrderModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load orders: $e');
    }
  }

  Future<List<OrderModel>> createOrder(List<OrderRequest> orders) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/payments'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orders.map((order) => order.toJson()).toList()),
      );
      return (response as List)
          .map((json) => OrderModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }
}
