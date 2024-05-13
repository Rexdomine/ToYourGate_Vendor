import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';
import 'package:tyg_vendor/features/order/model/pending_order.dart';

import '../../menue/presentation/create_menu.dart';
import '../../order/controller/order.dart';
import '../../profile/controller/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late TabController tabController;

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    orderController.getPendingOrderController();
    orderController.getDeliveredOrders();
    orderController.getActiveOrders();
    orderController.getOndGoOrders();
    tabController = TabController(length: 4, vsync: this);
  }

  final orderController = Get.put(OrderController());
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateMenuScreen());
        },
        backgroundColor: AppColors.mainRed,
        child: Icon(
          Icons.menu_open,
          color: AppColors.whiteColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Obx(
          () => profileController.loadedModel.value.data == null
              ? Text(
                  'Welcome! User' ?? '',
                  style: AppStyles.poppinsText(
                      fontWeight: FontWeight.w700,
                      size: 17,
                      color: AppColors.mainRed),
                )
              : Text(
                  'Welcome! ${profileController.loadedModel.value.data?.name}' ??
                      '',
                  style: AppStyles.poppinsText(
                      fontWeight: FontWeight.w700,
                      size: 17,
                      color: AppColors.mainRed),
                ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          TabBar(
            isScrollable: true,
            dividerColor: AppColors.mainRed,
            dividerHeight: 0,
            indicatorColor: AppColors.mainRed,
            labelStyle: AppStyles.poppinsText(
                fontWeight: FontWeight.w600,
                size: 15,
                color: AppColors.mainRed),
            unselectedLabelStyle: AppStyles.poppinsText(
                fontWeight: FontWeight.w500,
                size: 13,
                color: AppColors.blackColor.withOpacity(0.2)),
            controller: tabController,
            tabs: const [
              Tab(
                text: 'Active orders',
              ),
              Tab(
                text: 'pending Orders',
              ),
              Tab(
                text: 'On The go',
              ),
              Tab(
                text: 'Delivered Orders',
              ),
            ],
            labelColor: Colors.black,
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            OrdersWidget(),
            PendingOrdersWidget(),
            OndGoOtherWidget(),
            DeliveredOrderWidget()
          ]))
        ],
      ),
    );
  }
}

class OrdersWidget extends StatelessWidget {
  OrdersWidget({
    super.key,
  });

  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => orderController.loadingActiveOrders.value
          ? Center(
              child: CustomLoaderWidget(
                color: AppColors.redColor,
              ),
            )
          : orderController.activeOrderModel.value.data!.isEmpty
              ? Center(
                  child: Text('No Active orders'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            indent: 10,
                            color: AppColors.whiteColor,
                          ),
                      itemCount:
                          orderController.activeOrderModel.value.data!.length,
                      itemBuilder: (context, index) {
                        var activeOrder =
                            orderController.activeOrderModel.value.data![index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://dashboard.toyourgateexpress.com/storage/${activeOrder.orderDetails!.image}'))),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    activeOrder.orderDetails?.name ?? "",
                                    style: AppStyles.poppinsText(
                                        fontWeight: FontWeight.w500,
                                        size: 14,
                                        color: AppColors.blackColor),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'payment Type',
                                        style: AppStyles.poppinsText(
                                            fontWeight: FontWeight.w400,
                                            size: 14,
                                            color: AppColors.blackColor),
                                      ),
                                      Text(
                                        'CASH',
                                        style: AppStyles.poppinsText(
                                            fontWeight: FontWeight.w400,
                                            size: 12,
                                            color: AppColors.mainRed),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                color: AppColors.blackColor.withOpacity(0.1),
                              ),
                              Text(
                                'Delivery Address: ${activeOrder.address?.address}',
                                style: AppStyles.poppinsText(
                                    fontWeight: FontWeight.w500, size: 14),
                              )
                            ],
                          ),
                        );
                      }),
                ),
    );
  }
}

class OndGoOtherWidget extends StatelessWidget {
  OndGoOtherWidget({
    super.key,
  });

  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => orderController.loadingonDGoOrders.value
          ? Center(
              child: CustomLoaderWidget(
                color: AppColors.redColor,
              ),
            )
          : orderController.onDGoModel.value.data!.isEmpty
              ? Center(
                  child: Text('No Active orders'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            indent: 10,
                            color: AppColors.whiteColor,
                          ),
                      itemCount: orderController.onDGoModel.value.data!.length,
                      itemBuilder: (context, index) {
                        var activeOrder =
                            orderController.activeOrderModel.value.data![index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://dashboard.toyourgateexpress.com/storage/${activeOrder.orderDetails!.image}'))),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    activeOrder.orderDetails?.name ?? "",
                                    style: AppStyles.poppinsText(
                                        fontWeight: FontWeight.w500,
                                        size: 14,
                                        color: AppColors.blackColor),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'payment Type',
                                        style: AppStyles.poppinsText(
                                            fontWeight: FontWeight.w400,
                                            size: 14,
                                            color: AppColors.blackColor),
                                      ),
                                      Text(
                                        'CASH',
                                        style: AppStyles.poppinsText(
                                            fontWeight: FontWeight.w400,
                                            size: 12,
                                            color: AppColors.mainRed),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                color: AppColors.blackColor.withOpacity(0.1),
                              ),
                              Text(
                                'Delivery Address: ${activeOrder.address?.address}',
                                style: AppStyles.poppinsText(
                                    fontWeight: FontWeight.w500, size: 14),
                              )
                            ],
                          ),
                        );
                      }),
                ),
    );
  }
}

class PendingOrdersWidget extends StatelessWidget {
  PendingOrdersWidget({
    super.key,
  });

  final orderController = Get.put(OrderController());
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => orderController.loadingPendingOrders.value
          ? Center(
              child: CustomLoaderWidget(
                color: AppColors.redColor,
              ),
            )
          : orderController.loadedPendingOrders.value.data!.isEmpty
              ? Center(
                  child: Text(
                    'You have no pending orders',
                    style: AppStyles.poppinsText(
                        fontWeight: FontWeight.w400,
                        size: 14,
                        color: AppColors.blackColor),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            indent: 10,
                            color: AppColors.redColor,
                          ),
                      itemCount: orderController
                          .loadedPendingOrders.value.data!.length,
                      itemBuilder: (context, index) {
                        var orders = orderController
                            .loadedPendingOrders.value.data![index];
                        return GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              OrderConfirmationModal(
                                product: orders,
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.whiteColor,
                              border: Border.all(
                                  color: AppColors.blackColor.withOpacity(0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackColor.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: orders.orderDetails!
                                                          .image ==
                                                      null
                                                  ? NetworkImage(
                                                      'https://www.istockphoto.com/vector/store-line-icon-outline-vector-symbol-illustration-pixel-perfect-editable-stroke-gm1194059544-339859993')
                                                  : NetworkImage(
                                                      'https://dashboard.toyourgateexpress.com/storage/${orders.orderDetails!.image}'))),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      orders.orderDetails?.name ?? '',
                                      style: AppStyles.poppinsText(
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          color: AppColors.blackColor),
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'payment Type',
                                          style: AppStyles.poppinsText(
                                              fontWeight: FontWeight.w400,
                                              size: 14,
                                              color: AppColors.blackColor),
                                        ),
                                        Text(
                                          orders.orderDetails?.price ?? '',
                                          style: AppStyles.poppinsText(
                                              fontWeight: FontWeight.w400,
                                              size: 12,
                                              color: AppColors.mainRed),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  color: AppColors.blackColor.withOpacity(0.1),
                                ),
                                Text(
                                  orders.address?.address ?? '',
                                  style: AppStyles.poppinsText(
                                      fontWeight: FontWeight.w500, size: 14),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
    );
  }
}

class OrderConfirmationModal extends StatelessWidget {
  final PendingOrderDatum product;
  OrderConfirmationModal({
    super.key,
    required this.product,
  });
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: AppColors.whiteColor),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 100,
            color: AppColors.mainRed,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.blackColor),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: product.orderDetails!.image == null
                              ? NetworkImage(
                                  'https://www.istockphoto.com/vector/store-line-icon-outline-vector-symbol-illustration-pixel-perfect-editable-stroke-gm1194059544-339859993')
                              : NetworkImage(
                                  'https://dashboard.toyourgateexpress.com/storage/${product.orderDetails!.image}'))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.orderDetails?.name ?? '',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w400,
                          size: 16,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      product.address?.address ?? '',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w600,
                          size: 13,
                          color: AppColors.blackColor),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Card payment',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w600,
                          size: 13,
                          color: AppColors.redColor),
                    ),
                    Text(
                      '\$${product.orderDetails?.price}',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: AppColors.mainRed),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Order Details',
            style: AppStyles.poppinsText(
                fontWeight: FontWeight.w700,
                size: 16,
                color: AppColors.redColor),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.blackColor),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              product.orderDetails?.name ?? '',
              style: AppStyles.poppinsText(
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: AppColors.blackColor),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Obx(
            () => CustomButtonWidget(
                buttonText: 'Confirm Order',
                onPressed: () async {
                  await orderController.updateOrderController(product.orderId);
                  Get.back();
                },
                bgcolor: AppColors.greenColor,
                isLoading: orderController.isLoading.value),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => CustomButtonWidget(
                buttonText: 'Cancel Order',
                onPressed: () {
                  orderController.declineOrderController(product.orderId);
                  Get.back();
                },
                bgcolor: AppColors.mainRed,
                isLoading: orderController.declining.value),
          )
        ],
      ),
    );
  }
}

class DeliveredOrderWidget extends StatelessWidget {
  DeliveredOrderWidget({
    super.key,
  });
  final ordersController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ordersController.loadingDeliveredOrders.value
          ? Center(
              child: CustomLoaderWidget(
                color: AppColors.redColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        indent: 10,
                        color: AppColors.whiteColor,
                      ),
                  itemCount:
                      ordersController.loadedDeliveredOrders.value.data!.length,
                  itemBuilder: (context, index) {
                    var deliveries = ordersController
                        .loadedDeliveredOrders.value.data![index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor,
                        border: Border.all(
                            color: AppColors.blackColor.withOpacity(0.2)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://dashboard.toyourgateexpress.com/storage/${deliveries.orderDetails!.image}'))),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                deliveries.orderDetails?.name ?? "",
                                style: AppStyles.poppinsText(
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    color: AppColors.blackColor),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Status:',
                                    style: AppStyles.poppinsText(
                                        fontWeight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.blackColor),
                                  ),
                                  Text(
                                    'Delivered',
                                    style: AppStyles.poppinsText(
                                        fontWeight: FontWeight.w400,
                                        size: 12,
                                        color: AppColors.mainRed),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            color: AppColors.blackColor.withOpacity(0.1),
                          ),
                          Text(
                            'Delivered to ${deliveries.customer?.name} ',
                            style: AppStyles.poppinsText(
                                fontWeight: FontWeight.w500, size: 14),
                          )
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}
