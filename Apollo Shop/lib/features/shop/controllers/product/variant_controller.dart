import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/product/variant_model.dart';
import 'package:apolloshop/data/repositories/variant/variant_repository.dart';
import 'package:get/get.dart';

class VariantController extends GetxController {
  static VariantController get instance => Get.find();

  final isLoading = false.obs;
  final VariantRepository _variantRepository = Get.find();
  RxList<VariantModel> variants = <VariantModel>[].obs;
  final int productId;
  Rx<VariantModel?> selectedVariant = Rx<VariantModel?>(null);
  VariantController(this.productId);

  @override
  void onInit() {
    fetchVariantsByProduct(productId);
    super.onInit();
  }

  Future<void> fetchVariantsByProduct(int productId) async {
    try {
      isLoading.value = true;

      // Fetch Variants
      final getVariants =
          await _variantRepository.getVariantsByProductId(productId);

      // Assign fetched Variants to the observable list
      variants.assignAll(
        getVariants.where((e) => e.img.isNotEmpty).toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
