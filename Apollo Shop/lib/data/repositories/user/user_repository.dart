import 'package:apolloshop/data/services/authentication/authentication_service.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final authService = Get.find<AuthenticationService>();
}
