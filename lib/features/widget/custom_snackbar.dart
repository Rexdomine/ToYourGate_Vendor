import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class CustomSnackbar {
  static successSnackBar(message) {
    Get.snackbar('Sucess', message,
        backgroundColor: AppColors.blackColor, colorText: AppColors.whiteColor);
  }

  static errorSnackBar(message) {
    Get.snackbar('Opps', message,
        backgroundColor: AppColors.redColor, colorText: AppColors.whiteColor);
  }
}
