import 'package:get/get.dart';
import 'package:tyg_vendor/features/profile/model/profile.dart';
import 'package:tyg_vendor/features/profile/repository/profile.dart';
import 'package:tyg_vendor/features/widget/custom_snackbar.dart';

class ProfileController extends GetxController {
  final profileRepo = ProfileRepository();
  RxBool isLoading = RxBool(false);
  var loadedModel = ProfileModel().obs;
  RxBool updatingShop = RxBool(false);

  @override
  void onInit() {
    getUserProfileController();
    super.onInit();
  }

  Future getUserProfileController() async {
    try {
      isLoading(true);
      var response = await profileRepo.getUserProfileRepo();
      isLoading(false);
      loadedModel.value = profileModelFromJson(response);
    } catch (e) {
      isLoading(false);
    }
  }

  Future updateShop(params) async {
    try {
      updatingShop(true);
      await profileRepo.updateShopRepo(params);
      updatingShop(false);
      CustomSnackbar.successSnackBar('Update successful');
      getUserProfileController();
    } catch (e) {
      updatingShop(false);
      CustomSnackbar.errorSnackBar('$e');
    }
  }
}
