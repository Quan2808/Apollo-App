import 'package:apolloshop/common/widgets/loaders/loaders.dart';
import 'package:apolloshop/data/models/cart/cart_item_model.dart';
import 'package:apolloshop/data/models/product/product_model.dart';
import 'package:apolloshop/data/models/product/variant_model.dart';
import 'package:apolloshop/features/shop/controllers/product/variant_controller.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variantController = VariantController.instance;

  CartController() {
    loadCartItems();
  }

  void addProductToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      Loaders.warningSnackBar(
        title: 'Select quantity',
        message: 'Please select quantity',
      );
      return;
    }

    if (variantController.selectedVariant.value?.id == null) {
      Loaders.warningSnackBar(
          title: 'Select Variant', message: 'Please select a variant');
      return;
    }

    final selectedCartItem =
        convertVariantToCartItem(product, productQuantityInCart.value);

    if (selectedCartItem != null) {
      int index = cartItems.indexWhere((cartItem) =>
          cartItem.variant?.id == selectedCartItem.variant?.id &&
          cartItem.product?.id == selectedCartItem.product?.id);

      if (index >= 0) {
        cartItems[index].quantity = selectedCartItem.quantity;
      } else {
        cartItems.add(selectedCartItem);
      }

      updateCart();
      Loaders.successSnackBar(
        title: 'Successfully',
        message: 'Your product has been added to cart',
      );
    }
  }

  CartItemModel? convertVariantToCartItem(ProductModel product, int quantity) {
    // Fetch variants synchronously. Assuming fetchVariantsByProduct is already complete.
    variantController.fetchVariantsByProduct(product.id);

    if (variantController.variants.isEmpty) {
      variantController.resetSelectedVariant();
      return null;
    }

    final variant = variantController.selectedVariant.value;
    if (variant == null) {
      return null;
    }

    final selectedVariants = {
      'id': variant.id,
      'name': variant.name,
      'skuCode': variant.skuCode,
      'stockQuantity': variant.stockQuantity,
      'weight': variant.weight,
      'price': variant.price,
      'salePrice': variant.salePrice,
      'img': variant.img,
      'isDeleted': variant.isDeleted,
    };

    return CartItemModel(
      product: product,
      quantity: quantity,
      variant: variant,
      price: variant.price,
      store: product.store,
      selectedVariants: selectedVariants,
    );
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double setTotalCartPrice = 0.0;
    int setNoOfCartItems = 0;

    for (var item in cartItems) {
      setTotalCartPrice += item.price * item.quantity.toDouble();
      setNoOfCartItems += item.quantity;
    }

    totalCartPrice.value = setTotalCartPrice;
    noOfCartItems.value = setNoOfCartItems;
  }

  void saveCartItems() {
    final cartItemsList = cartItems.map((item) => item.toJson()).toList();
    GetStorage().write('cartItems', cartItemsList);
  }

  void loadCartItems() {
    final cartItemsList = GetStorage().read<List>('cartItems');
    if (cartItemsList != null) {
      cartItems.assignAll(cartItemsList
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantity(ProductModel product) {
    return cartItems
        .where((item) => item.product?.id == product.id)
        .fold(0, (prev, e) => prev + e.quantity);
  }

  int getVariantQuantity(ProductModel product, VariantModel variant) {
    return cartItems
        .firstWhere(
            (item) =>
                item.product?.id == product.id &&
                item.variant?.id == variant.id,
            orElse: () => CartItemModel.empty())
        .quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void addAnItemToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.product?.id == item.product?.id &&
        cartItem.variant?.id == item.variant?.id);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeAnItemToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.product?.id == item.product?.id &&
        cartItem.variant?.id == item.variant?.id);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        removeFromCartDialog(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    if (index >= 0 && index < cartItems.length) {
      Get.defaultDialog(
        title: 'Remove from Cart',
        middleText: 'Are you sure you want to remove this item from your cart?',
        textConfirm: 'Yes',
        textCancel: 'Cancel',
        confirmTextColor: Colors.white,
        onConfirm: () {
          cartItems.removeAt(index);
          updateCart();
          Loaders.successSnackBar(
            title: 'Success',
            message: 'Item has been removed from the cart.',
          );
          Navigator.of(Get.overlayContext!).pop();
        },
        onCancel: () => Get.closeAllSnackbars(),
        barrierDismissible: false,
        radius: 10.0,
      );
    } else {
      Loaders.errorSnackBar(
        title: 'Error',
        message: 'Invalid item index. Please try again.',
      );
    }
  }

  void updateAlreadyInCart(ProductModel product) {
    final variant = variantController.selectedVariant.value;

    if (variant != null) {
      productQuantityInCart.value = getVariantQuantity(product, variant);
    } else {
      productQuantityInCart.value = 0;
    }
  }
}
