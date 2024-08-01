import 'package:apolloshop/common/widgets/loaders/animation_loader.dart';
import 'package:apolloshop/utils/constants/colors.dart';
import 'package:apolloshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            // Center widget to make sure content is centered
            child: SingleChildScrollView(
              // Allow content to scroll if it exceeds screen height
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Avoid taking unnecessary space
                children: [
                  AnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
