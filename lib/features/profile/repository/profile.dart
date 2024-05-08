import 'package:tyg_vendor/constants/api_route.dart';
import 'package:tyg_vendor/constants/http_service.dart';

class ProfileRepository {
  Future getUserProfileRepo() async {
    final response = await HttpService.httpGetCall(ApiRoutes.getProfile);
    return response;
  }

  Future updateShopRepo(params) async {
    final response =
        await HttpService.httpPostCall(ApiRoutes.updateShop, params);
    return response;
  }
}
