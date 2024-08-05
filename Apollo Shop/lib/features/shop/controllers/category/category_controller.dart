import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/category/category_model.dart';
import 'package:apolloshop/data/repositories/category/category_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final CategoryRepository _categoryRepository = Get.find();
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

      // Assign fetched categories to the observable list
      categories.assignAll(getCategories);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
