import 'package:get/get.dart';
import 'package:tyg_vendor/features/menue/model/add_ons.dart';
import 'package:tyg_vendor/features/menue/model/menu.dart';
import 'package:tyg_vendor/features/menue/repository/menu.dart';
import 'package:tyg_vendor/features/widget/custom_snackbar.dart';

class VendorMenuController extends GetxController {
  List addon = [];
  final menuRepo = MenuRepository();
  RxBool isLoading = RxBool(false);
  RxBool creatingMenu = RxBool(false);
  RxBool updatingMenu = RxBool(false);
  RxBool adding = RxBool(false);
  RxBool loading = RxBool(false);
  var loadedAdons = AddonsModel().obs;
  var loadedMenu = MenuModel().obs;
  var addonList = [];
  @override
  void onInit() {
    super.onInit();
    getAddonController();
    // getMenuController();
  }

  Future getMenuController() async {
    try {
      isLoading(true);
      var result = await menuRepo.getMenue();
      isLoading(false);
      loadedMenu.value = menuModelFromJson(result);
    } catch (e) {
      isLoading(false);
    }
  }

  Future createMenuController(params) async {
    try {
      creatingMenu(true);
      await menuRepo.createMenuRepository(params);
      creatingMenu(false);
      CustomSnackbar.successSnackBar('Menu Created Successfully');
    } catch (e) {
      creatingMenu(false);
      CustomSnackbar.errorSnackBar(e);
    }
  }

  Future updateMenu(params) async {
    try {
      updatingMenu(true);
      await menuRepo.upDateMenuRepository(params);
      updatingMenu(false);
    } catch (e) {
      updatingMenu(true);
    }
  }

  Future createAddonController(param) async {
    try {
      adding(true);
      var result = await menuRepo.createAddonRepo(param);
      adding(false);
      CustomSnackbar.successSnackBar('successful');
      getAddonController();
    } catch (e) {
      adding(false);
      CustomSnackbar.errorSnackBar(e);
    }
    ;
  }

  Future getAddonController() async {
    try {
      loading(false);
      var result = await menuRepo.getAddonsRepo();
      loading(false);
      loadedAdons.value = addonsModelFromJson(result);
      // CustomSnackbar.successSnackBar('succeful');
    } catch (e) {
      loading(false);
      CustomSnackbar.errorSnackBar(e);
    }
    ;
  }
}
