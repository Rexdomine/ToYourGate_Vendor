import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyg_vendor/constants/api_route.dart';
import 'package:tyg_vendor/constants/http_service.dart';

class AuthRepositpory {
  Future registerUser(param) async {
    final response =
        await HttpService.httpPostCall(ApiRoutes.registerRoute, param);
    return response;
  }

  Future loginUserRepository(params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response =
        await HttpService.httpPostCall(ApiRoutes.loginRoute, params);
    preferences.setString('token', response['authorisation']['token']);
    return response;
  }
}
