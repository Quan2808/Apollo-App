import 'package:apolloshop/app.dart';
import 'package:apolloshop/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  // GetX Local Storage
  await GetStorage.init();

  // Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  // Initialize AuthenticationRepository
  Get.put(AuthenticationRepository());
  runApp(const App());
}
