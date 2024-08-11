import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:apolloshop/data/models/order/order_model.dart';

class OrderService extends GetxService {
  static OrderService get instance => Get.find();

  final String baseUrl = ApiConstants.baseApiUrl;

  Future<Map<String, dynamic>?> getShopOrder(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/payments/shop-order/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to get orders. Status code: ${response.statusCode}');
    }
  }

  Future<List<OrderModel>> createShopOrder(
      List<Map<String, dynamic>> orderRequests) async {
    final response = await http.post(
      Uri.parse('$baseUrl/payments/shop-order'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(orderRequests),
    );

    if (response.statusCode == 201) {
      List<dynamic> ordersJson = jsonDecode(response.body);
      return ordersJson
          .map((orderJson) => OrderModel.fromSnapshot(orderJson))
          .toList();
    } else {
      throw Exception(
          'Failed to create shop order. Status code: ${response.statusCode}');
    }
  }
}
