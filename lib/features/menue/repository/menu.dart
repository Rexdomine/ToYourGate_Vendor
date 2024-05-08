import 'package:tyg_vendor/constants/api_route.dart';
import 'package:tyg_vendor/constants/http_service.dart';

class MenuRepository {
  Future getMenue() async {
    final response = await HttpService.httpGetCall(ApiRoutes.getMenue);
    return response;
  }

  Future createMenuRepository(params) async {
    final request =
        await HttpService.httpPostCall(ApiRoutes.createMenu, params);
    return request;
  }

  Future upDateMenuRepository(params) async {
    final request = HttpService.httpPostCall(ApiRoutes.updateMenu, params);
    return request;
  }

  Future createAddOnRepository(params) async {
    final request = HttpService.httpPostCall(ApiRoutes.loginRoute, params);
    return request;
  }
}
