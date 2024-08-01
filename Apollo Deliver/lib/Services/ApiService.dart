import 'dart:convert';
import 'package:apollodeliver/Dto/JwtResponse.dart';
import 'package:apollodeliver/Dto/ShipperLoginDTO.dart';
import 'package:apollodeliver/Dto/ShipperRegisterDTO.dart';
import 'package:http/http.dart' as http;

class AuthService {
    final String baseUrl = 'http://192.168.1.7:9999/api';

    Future<JwtResponse> loginShipper(ShipperLoginDTO loginDTO) async {
        final response = await http.post(
            Uri.parse('$baseUrl/login/shipper'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(loginDTO.toJson()),
        );

        if (response.statusCode == 200) {
            final jwtResponse = JwtResponse.fromJson(jsonDecode(response.body));
            // Lưu token vào SharedPreferences hoặc bất kỳ nơi nào bạn muốn lưu trữ
            // Ví dụ:
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // await prefs.setString('accessToken', jwtResponse.accessToken);
            return jwtResponse;
        } else {
            throw Exception('Failed to login');
        }
    }

    Future<void> registerShipper(ShipperRegisterDTO registerDTO) async {
        final response = await http.post(
            Uri.parse('$baseUrl/register/shipper'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(registerDTO.toJson()),
        );

        if (response.statusCode != 200) {
            throw Exception('Failed to register');
        }
    }

    Future<void> fetchProtectedResource(String token) async {
        final response = await http.get(
            Uri.parse('$baseUrl/protected/resource'), // Thay đổi URL cho phù hợp
            headers: {
                'Authorization': 'Bearer $token', // Thêm tiền tố Bearer
            },
        );

        if (response.statusCode == 200) {
            // Xử lý phản hồi thành công
        } else {
            throw Exception('Failed to fetch protected resource');
        }
    }
}
