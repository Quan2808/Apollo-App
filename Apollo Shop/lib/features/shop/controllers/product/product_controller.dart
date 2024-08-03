import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/product/product_model.dart';
import 'package:apolloshop/data/repositories/product/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final ProductRepository _productRepository = Get.find();
  RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final getProducts = await _productRepository.getProducts();

      // Assign fetched Products to the observable list
      products.assignAll(
        getProducts.where((e) => e.thumbnail.isNotEmpty).toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
