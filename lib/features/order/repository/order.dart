import '../../../constants/api_route.dart';
import '../../../constants/http_service.dart';

class OrderRepository {
  Future getOrdeRepository() async {
    final response = await HttpService.httpGetCall(ApiRoutes.getOndGoOrders);
    return response;
  }

  Future getPedingOrdeRepository() async {
    final response = await HttpService.httpGetCall(ApiRoutes.getPendingOrders);
    return response;
  }

  Future getActiveOrderRepository() async {
    final response = await HttpService.httpGetCall(ApiRoutes.getActiveOrders);
    return response;
  }

  Future getOnDGoOrdersRepository() async {
    final response = await HttpService.httpGetCall(ApiRoutes.getOndGoOrders);
    return response;
  }

  Future getDeliveredRepository() async {
    final response =
        await HttpService.httpGetCall(ApiRoutes.getDeliveredOrders);
    return response;
  }

  Future updateOrder(orderId) async {
    final response = await HttpService.httpPostCall(
        ApiRoutes.updateOrder, {"order_id": orderId});
    return response;
  }

    Future declineOrder(orderId) async {
    final response = await HttpService.httpPostCall(
        ApiRoutes.declineOrder, {"order_id": orderId});
    return response;
  }


}
