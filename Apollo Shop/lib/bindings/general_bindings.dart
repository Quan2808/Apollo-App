import 'package:apolloshop/data/repositories/category/category_repository.dart';
import 'package:apolloshop/data/repositories/product/product_repository.dart';
import 'package:apolloshop/data/repositories/store/store_repository.dart';
import 'package:apolloshop/data/repositories/variant/variant_repository.dart';
import 'package:apolloshop/data/services/category/category_service.dart';
import 'package:apolloshop/data/services/product/product_service.dart';
import 'package:apolloshop/data/services/store/store_service.dart';
import 'package:apolloshop/data/services/variant/variant_service.dart';
import 'package:apolloshop/features/authentication/network/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());

    Get.put(ProductService());
    Get.put(ProductRepository());

    Get.put(VariantService());
    Get.put(VariantRepository());

    Get.put(CategoryService());
    Get.put(CategoryRepository());

    Get.put(StoreService());
    Get.put(StoreRepository());
  }
}
