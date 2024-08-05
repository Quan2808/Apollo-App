import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/category/category_model.dart';
import 'package:apolloshop/data/repositories/category/category_repository.dart';
import 'package:apolloshop/data/repositories/product/product_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final CategoryRepository _categoryRepository = Get.find();
  final ProductRepository _productRepository = Get.find();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      // Fetch categories
      final getCategories = await _categoryRepository.getCategories();

      // Fetch products
      final products = await _productRepository.getProducts();

      // Create a set of category IDs that have stores
      final Set<int> categoryIdsWithStore = products
          .where((product) => product.store != null)
          .map((product) => product.category?.id)
          .toSet()
          .cast<int>();

      // Filter categories to include only those with stores
      final filteredCategories = getCategories
          .where((category) => categoryIdsWithStore.contains(category.id))
          .toList();

      // Assign filtered categories to the observable list
      categories.assignAll(filteredCategories);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
