import 'package:get/get.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';
import 'package:tyg_vendor/features/authentication/repository/auth_repository.dart';
import 'package:tyg_vendor/features/bottom%20navigation/presentation/bottom_nav.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepositpory();
  RxBool registeringUser = RxBool(false);
  RxBool verifyingUser = RxBool(false);
  RxBool isLoading = RxBool(false);
  RxBool isObscured = RxBool(true);

  RxBool loggingIn = RxBool(false);
  Future createUserController(param) async {
    try {
      isLoading(true);
      await authRepository.registerUser(param);
      isLoading(false);
      Get.offAll(() => LoginScreen());
    } catch (e) {
      isLoading(false);
    }
  }

  Future loginUserController(params) async {
    try {
      loggingIn(true);
      await authRepository.loginUserRepository(params);
      loggingIn(false);
      Get.offAll(() => BottomNavigationScreen());
    } catch (e) {
      loggingIn(false);
    }
  }
}
