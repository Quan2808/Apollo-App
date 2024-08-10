import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:apolloshop/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  static CartService get instance => Get.find();

  final String baseUrl = ApiConstants.baseApiUrl;

  /// Post a new cart for the user based on the provided user details.
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
      throw Exception(
          'Failed to register new cart. Status code: ${response.statusCode}');
    }
  }

  /// Get the cart associated with a specific user ID.
  Future<Map<String, dynamic>?> getCart({
    required String userId,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cart/user/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      // Handle not found error
      return null;
    } else {
      throw Exception(
          'Failed to retrieve cart. Status code: ${response.statusCode}');
    }
  }

  /// Handle common API errors by parsing the response and throwing exceptions.
  void _handleError(http.Response response) {
    final errorData = jsonDecode(response.body);
    throw Exception(
        'API Error: ${response.statusCode}. Message: ${errorData['message'] ?? 'Unknown error'}');
  }
}
