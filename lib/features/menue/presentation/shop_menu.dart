import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';
import 'package:tyg_vendor/features/menue/controller/menu.dart';
import 'package:tyg_vendor/features/profile/controller/profile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

final menuController = Get.put(VendorMenuController());
final profileController = Get.put(ProfileController());

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    menuController.getMenuController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        title: Text(
          'Menu Listings',
          style: AppStyles.poppinsText(
              fontWeight: FontWeight.w400,
              size: 15,
              color: AppColors.blackColor),
        ),
      ),
      body: Obx(
        () => menuController.isLoading.value
            ? Center(
                child: CustomLoaderWidget(
                  color: AppColors.mainRed,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          indent: 10,
                          color: AppColors.whiteColor,
                        ),
                    itemCount: menuController.loadedMenu.value.data!.length,
                    itemBuilder: (context, index) {
                      var menue = menuController.loadedMenu.value.data![index];
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
                                          image: menue.image == null
                                              ? NetworkImage(
                                                  'https://dashboard.toyourgateexpress.com/storage/${profileController.loadedModel.value.data!.logo}')
                                              : NetworkImage(
                                                  'https://dashboard.toyourgateexpress.com/storage/${menue.image}'))),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  menue.name ?? "",
                                  style: AppStyles.poppinsText(
                                      fontWeight: FontWeight.w500,
                                      size: 14,
                                      color: AppColors.blackColor),
                                ),
                                Spacer(),
                              ],
                            ),
                            Divider(
                              color: AppColors.blackColor.withOpacity(0.1),
                            ),
                            Text(
                              'Delivery Address: ${menue.description}',
                              style: AppStyles.poppinsText(
                                  fontWeight: FontWeight.w500, size: 14),
                            )
                          ],
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
