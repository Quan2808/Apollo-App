import 'package:apolloshop/app.dart';
import 'package:apolloshop/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(NavigationController());
  runApp(const App());
}
