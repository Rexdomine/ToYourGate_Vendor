import 'package:get/get.dart';
import 'package:tyg_vendor/features/order/model/delivered.dart';
import 'package:tyg_vendor/features/order/model/on_d_go.dart';
import 'package:tyg_vendor/features/order/model/pending_order.dart';
import 'package:tyg_vendor/features/order/repository/order.dart';
import 'package:tyg_vendor/features/widget/custom_snackbar.dart';

import '../model/active_order.dart';

class OrderController extends GetxController {
  final orderRepository = OrderRepository();
  RxBool loadingOrders = RxBool(false);
  RxBool loadingPendingOrders = RxBool(false);
  RxBool loadingActiveOrders = RxBool(false);
  RxBool loadingonDGoOrders = RxBool(false);
  RxBool loadingDeliveredOrders = RxBool(false);
  var loadedPendingOrders = PendingOrderModel().obs;
  var loadedDeliveredOrders = DeliveredOrderModel().obs;
  var activeOrderModel = ActiveOrderModel().obs;
  var onDGoModel = OndGoOrderModel().obs;
  RxBool isLoading = RxBool(false);
  RxBool declining = RxBool(false);

  @override
  void onClose() {
    getPendingOrderController();
    getDeliveredOrders();
    getActiveOrders();
    getOndGoOrders();

    super.onClose();
  }

  Future getOrderController() async {
    try {
      loadingOrders(true);
      var result = await orderRepository.getOrdeRepository();
      loadingOrders(false);
    } catch (e) {
      loadingOrders(false);
    }
  }

  Future getPendingOrderController() async {
    try {
      loadingPendingOrders(true);
      var result = await orderRepository.getPedingOrdeRepository();
      loadingPendingOrders(false);
      loadedPendingOrders.value = pendingOrderModelFromJson(result);
    } catch (e) {
      loadingPendingOrders(false);
    }
  }

  Future getActiveOrders() async {
    try {
      loadingActiveOrders(true);
      var result = await orderRepository.getActiveOrderRepository();
      loadingActiveOrders(false);
      activeOrderModel.value = activeOrderModelFromJson(result);
    } catch (e) {
      loadingActiveOrders(false);
    }
  }

  Future getOndGoOrders() async {
    try {
      loadingonDGoOrders(true);
      var result = await orderRepository.getOnDGoOrdersRepository();
      loadingonDGoOrders(false);
      onDGoModel.value = ondGoOrderModelFromJson(result);
    } catch (e) {
      loadingonDGoOrders(false);
    }
  }

  Future getDeliveredOrders() async {
    try {
      loadingDeliveredOrders(true);
      var result = await orderRepository.getDeliveredRepository();
      loadingDeliveredOrders(false);
      loadedDeliveredOrders.value = deliveredOrderModelFromJson(result);
    } catch (e) {
      loadingDeliveredOrders(false);
    }
  }

  Future updateOrderController(orderId) async {
    try {
      isLoading(true);
      var result = await orderRepository.updateOrder(orderId);
      isLoading(true);
      CustomSnackbar.successSnackBar('Order status updated');
      getPendingOrderController();
    } catch (e) {
      isLoading(false);
      CustomSnackbar.errorSnackBar('$e');
    }
  }

  Future declineOrderController(orderId) async {
    try {
      declining(true);
      var result = await orderRepository.declineOrder(orderId);
      declining(true);
      CustomSnackbar.successSnackBar('Order Declined');
      getPendingOrderController();
    } catch (e) {
      declining(false);
      CustomSnackbar.errorSnackBar('$e');
    }
  }
}
