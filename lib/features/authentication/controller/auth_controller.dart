import 'package:get/get.dart';

class AuthController extends GetxController {
  // final authRepository = AuthRepository();
  RxBool registeringUser = RxBool(false);
  RxBool loginUser = RxBool(false);
  RxBool verifyingUser = RxBool(false);

  RxBool isObscured = RxBool(true);

}
