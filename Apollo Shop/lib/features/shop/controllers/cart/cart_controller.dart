import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/cart/cart_line_model.dart';
import 'package:apolloshop/data/models/product/product_model.dart';
import 'package:apolloshop/data/models/product/variant_model.dart';
import 'package:apolloshop/features/shop/controllers/product/variant_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartLineModel> cartItems = <CartLineModel>[].obs;
  final variantController = VariantController.instance;

  CartController() {
    // Load cart items if needed, or initialize as required
  }

  // Add items to cart
  void addToCart(VariantModel variant) {
    // Quantity to check
    if (productQuantityInCart.value < 1) {
      Loaders.warningSnackBar(
          title: 'Select quantity', message: 'Please select quantity');
      return;
    }

    // Variant selected
    if (variantController.selectedVariant.value?.id == null) {
      Loaders.warningSnackBar(
          title: 'Select Variant', message: 'Please select a variant');
      return;
    }

    // Convert VariantModel to CartLineModel with the given quantity
    final selectedCartItem =
        convertVariantToCartLine(variant, productQuantityInCart.value);

    // Check if already in the cart
    int index = cartItems.indexWhere(
        (cartItem) => cartItem.variant?.id == selectedCartItem.variant?.id);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    Loaders.successSnackBar(
        title: 'Successfully', message: 'Your product has been added to cart');
  }

  // Converts VariantModel to CartLineModel
  CartLineModel convertVariantToCartLine(VariantModel variant, int quantity) {
    return CartLineModel(
      variant: variant,
      quantity: quantity,
    );
  }

  void addAnItemToCart(CartLineModel cartLine) {
    int index = cartItems
        .indexWhere((item) => item.variant?.id == cartLine.variant?.id);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(cartLine);
    }

    updateCart();
  }

  void removeAnItemToCart(CartLineModel cartLine) {
    int index = cartItems
        .indexWhere((item) => item.variant?.id == cartLine.variant?.id);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }

    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Loaders.successSnackBar(
            title: 'Successfully', message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  void updateCart() {
    updateCartTotal();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double setTotalCartPrice = 0.0;
    int setNoOfCartItems = 0;

    for (var cartItem in cartItems) {
      setTotalCartPrice += cartItem.quantity * cartItem.variant!.price;
      setNoOfCartItems += cartItem.quantity;
    }
    noOfCartItems.value = setNoOfCartItems;
    totalCartPrice.value = setTotalCartPrice;
  }

  int getProductQuantityInCart(int variantId) {
    return cartItems
        .where((cartItem) => cartItem.variant?.id == variantId)
        .fold(0, (previousValue, e) => previousValue + e.quantity);
  }

  int getVariantQuantityInCart(int variantId) {
    final items = cartItems.firstWhere(
      (cartItem) => cartItem.variant?.id == variantId,
      orElse: () => CartLineModel.empty(),
    );

    return items.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    final variant = variantController.selectedVariant.value!.id;
    productQuantityInCart.value = getVariantQuantityInCart(variant);
  }
}
