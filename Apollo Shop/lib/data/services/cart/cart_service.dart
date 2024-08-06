import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  static CartService get instance => Get.find();

  final String baseUrl = ApiConstants.baseApiUrl;

  Future<void> postCart({
    required String clientName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cart'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'clientName': clientName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    } else {
      // Handle errors
      jsonDecode(response.body);
      throw Exception(
          'Failed to register new cart. Status code: ${response.statusCode}');
    }
  }
}
