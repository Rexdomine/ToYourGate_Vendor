import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';

class ShopSetUpScreen extends StatefulWidget {
  const ShopSetUpScreen({super.key});

  @override
  State<ShopSetUpScreen> createState() => _ShopSetUpScreenState();
}

class _ShopSetUpScreenState extends State<ShopSetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        title: Text(
          'Vendor setup',
          style: AppStyles.poppinsText(
              fontWeight: FontWeight.w600,
              size: 18,
              color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop Name',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w400,
                    size: 13,
                    color: AppColors.blackColor),
              ),
              CustomInputWidget(
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Shop Description',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w400,
                    size: 13,
                    color: AppColors.blackColor),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: AppColors.blackColor.withOpacity(0.2))),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Contact phone number',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w400,
                    size: 13,
                    color: AppColors.blackColor),
              ),
              CustomInputWidget(
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Address',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w400,
                    size: 13,
                    color: AppColors.blackColor),
              ),
              CustomInputWidget(
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'shop Cover photo',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w400,
                    size: 13,
                    color: AppColors.blackColor),
              ),
              Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.blackColor.withOpacity(0.2))),
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.mainRed,
                    size: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonWidget(
                buttonText: 'Proceed',
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
