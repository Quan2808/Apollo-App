import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/product/category_model.dart';
import 'package:apolloshop/data/models/product/product_model.dart';
import 'package:apolloshop/data/repositories/category/category_repository.dart';
import 'package:apolloshop/data/repositories/product/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final ProductRepository _productRepository = Get.find();
  final CategoryRepository _categoryRepository = Get.find();
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

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
      final getCategories = await _categoryRepository.getCategories();

      // Assign fetched Products to the observable list
      products.assignAll(
        getProducts.where((e) => e.thumbnail.isNotEmpty).toList(),
      );
      filteredProducts.assignAll(products);
      categories.assignAll(getCategories);
      categories.sort((a, b) =>
          a.attribute.toLowerCase().compareTo(b.attribute.toLowerCase()));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void sortProducts(String sortBy) {
    switch (sortBy) {
      case 'Name Ascending':
        filteredProducts.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Name Descending':
        filteredProducts.sort((a, b) => b.title.compareTo(a.title));
        break;

      default:
        filteredProducts.assignAll(products);
        break;
    }
  }

  void filterByCategory(CategoryModel category) {
    filteredProducts.value = products.where((product) {
      return product.category?.id == category.id;
    }).toList();
  }

  void filterByName(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.value = products.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
