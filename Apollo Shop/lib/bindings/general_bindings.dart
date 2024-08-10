import 'package:apolloshop/data/repositories/cart/cart_repository.dart';
import 'package:apolloshop/data/repositories/category/category_repository.dart';
import 'package:apolloshop/data/repositories/product/product_repository.dart';
import 'package:apolloshop/data/repositories/store/store_repository.dart';
import 'package:apolloshop/data/repositories/variant/variant_repository.dart';
import 'package:apolloshop/data/services/cart/cart_service.dart';
import 'package:apolloshop/data/services/category/category_service.dart';
import 'package:apolloshop/data/services/product/product_service.dart';
import 'package:apolloshop/data/services/store/store_service.dart';
import 'package:apolloshop/data/services/variant/variant_service.dart';
import 'package:apolloshop/features/authentication/network/network_manager.dart';
import 'package:apolloshop/features/shop/controllers/cart/cart_controller.dart';
import 'package:apolloshop/features/shop/controllers/product/variant_controller.dart';
import 'package:get/get.dart';

/// The `GeneralBindings` class is responsible for setting up dependency injection
/// for various services and repositories using the GetX package.
class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Register NetworkManager for handling network operations.
    Get.put(NetworkManager());

    // Register ProductService and its corresponding repository.
    Get.put(ProductService());
    Get.put(ProductRepository());

    // Register VariantService and its corresponding repository.
    Get.put(VariantService());
    Get.put(VariantRepository());
    Get.put(VariantController());

    // Register CategoryService and its corresponding repository.
    Get.put(CategoryService());
    Get.put(CategoryRepository());

    // Register StoreService and its corresponding repository.
    Get.put(StoreService());
    Get.put(StoreRepository());

    // Register CartService and its corresponding repository.
    Get.put(CartService());
    Get.put(CartRepository());

    Get.put(CartController());
  }
}
