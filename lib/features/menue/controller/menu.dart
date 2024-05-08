import 'package:get/get.dart';
import 'package:tyg_vendor/features/menue/repository/menu.dart';

class VendorMenuController extends GetxController {
  List addon = [];
  final menuRepo = MenuRepository();
  RxBool isLoading = RxBool(false);
  RxBool creatingMenu = RxBool(false);
  RxBool updatingMenu = RxBool(false);

  Future getMenuController() async {
    try {
      isLoading(true);
      var result = await menuRepo.getMenue();
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  Future createMenuController(params) async {
    try {
      creatingMenu(true);
      var result = await menuRepo.createMenuRepository(params);
      creatingMenu(false);
    } catch (e) {
      creatingMenu(false);
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
}
