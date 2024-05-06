import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyg_vendor/features/home/presentation/home.dart';
import 'package:tyg_vendor/features/profile/presentation/profile.dart';
import 'package:tyg_vendor/features/earnings/presentation/earning_home.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../controller/bottom_nav.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});
  final bottomNavigationContrller = Get.put(ButtonNavigationControlleR());

  final pages = [HomeScreen(), EarningScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => Center(
          child: pages.elementAt(bottomNavigationContrller.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedLabelStyle: AppStyles.poppinsText(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
                size: 12),
            backgroundColor: AppColors.mainRed,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.whiteColor.withOpacity(0.4),
            unselectedLabelStyle: AppStyles.poppinsText(
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
                size: 12),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.blackColor,
                icon: SizedBox(
                    height: 18,
                    child: Icon(
                      Icons.home_filled,
                      color: bottomNavigationContrller.selectedIndex == 0
                          ? AppColors.whiteColor
                          : AppColors.whiteColor.withOpacity(0.4),
                    )),
                label: 'Hone',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.blackColor,
                icon: SizedBox(
                    height: 18,
                    child: Icon(
                      Icons.earbuds,
                      color: bottomNavigationContrller.selectedIndex == 1
                          ? AppColors.whiteColor
                          : AppColors.whiteColor.withOpacity(0.4),
                    )),
                label: 'Earnings',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.blackColor,
                icon: SizedBox(
                    height: 18,
                    child: Icon(
                      Icons.person,
                      color: bottomNavigationContrller.selectedIndex == 2
                          ? AppColors.whiteColor
                          : AppColors.whiteColor.withOpacity(0.4),
                    )),
                label: 'Profile',
              ),
            ],
            currentIndex: bottomNavigationContrller.selectedIndex,
            onTap: (index) => bottomNavigationContrller.selectedIndex = index,
          )),
    );
  }
}
