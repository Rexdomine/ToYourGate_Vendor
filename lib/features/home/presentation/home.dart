import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';

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
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome! TKG Restaurant ',
          style: AppStyles.poppinsText(
              fontWeight: FontWeight.w700, size: 17, color: AppColors.mainRed),
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
                text: 'Delivered Orders',
              ),
              Tab(
                text: 'On The go',
              ),
            ],
            labelColor: Colors.black,
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: const [
            OrdersWidget(),
            OrdersWidget(),
            OrdersWidget(),
            OnTheGoWidget()
          ]))
        ],
      ),
    );
  }
}

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                indent: 10,
                color: AppColors.whiteColor,
              ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  OrderConfirmationModal(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  border:
                      Border.all(color: AppColors.blackColor.withOpacity(0.2)),
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
                                  image: AssetImage('assets/images/back.jpg'))),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '4 plate Rice ',
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
                      'Delivery Address: 4th street gwarimpa',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w500, size: 14),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class OrderConfirmationModal extends StatelessWidget {
  const OrderConfirmationModal({
    super.key,
  });

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
                          image: AssetImage('assets/images/logo.png'))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ThankGod Eze',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w400,
                          size: 16,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      '4th street. gwarimpa',
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
                      '\$3,000',
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
              'Jellof rice (3plates)',
              style: AppStyles.poppinsText(
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: AppColors.blackColor),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButtonWidget(
              buttonText: 'Confirm Order',
              onPressed: () {
                Get.back();
              },
              isLoading: false)
        ],
      ),
    );
  }
}

class OnTheGoWidget extends StatelessWidget {
  const OnTheGoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                indent: 10,
                color: AppColors.whiteColor,
              ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.bottomSheet(
                //     // OrderConfirmationModal(),
                //     );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  border:
                      Border.all(color: AppColors.blackColor.withOpacity(0.2)),
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
                                  image: AssetImage('assets/images/back.jpg'))),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '4 plate Rice ',
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
                      'Delivered to Rexdomine ',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w500, size: 14),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
