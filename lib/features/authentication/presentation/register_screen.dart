import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tyg_vendor/constants/location.dart';
import 'package:tyg_vendor/features/authentication/controller/auth_controller.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

File? logoPath;
File? backgroundPath;
List<int>? logoImageBytes;
List<int>? backgroundImageByte;

class _RegisterScreenState extends State<RegisterScreen> {
    final _authController = Get.put(AuthController());
    final locationController = Get.put(GetGeoLocation());
    final _registerKey = GlobalKey<FormState>();
    final ImagePicker _picker = ImagePicker();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController personalPhoneController = TextEditingController();
    TextEditingController shopNameController = TextEditingController();
    TextEditingController shopPhonrController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController minimumDeliveryPriceController =
        TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController pricePerkmController = TextEditingController();
    TextEditingController deliveryTimeController = TextEditingController();
    TextEditingController minimumAmountController = TextEditingController();
    TextEditingController taxController = TextEditingController();
    TextEditingController comissionController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Future<void> pickLogo() async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Do something with the picked image
        setState(() {
          logoPath = File(image.path);
          logoImageBytes = logoPath!.readAsBytesSync();
        });
        print('Image path: ${image.path}');
      } else {
        // User canceled the picker
        print('No image selected.');
      }
    }

    Future<void> pickbackGround() async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Do something with the picked image
        setState(() {
          backgroundPath = File(image.path);
          backgroundImageByte = backgroundPath!.readAsBytesSync();
        });
        print('Image path: ${image.path}');
      } else {
        // User canceled the picker
        print('No image selected.');
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Registeration',
          style: AppStyles.poppinsText(
              fontWeight: FontWeight.w500,
              size: 14,
              color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _registerKey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Let\'s get your started!',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w800,
                              size: 22,
                              color: AppColors.blackColor),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Shop Name',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: shopNameController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'First Name',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: firstNameController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Last Name',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: lastNameController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Personal Phone Number',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: personalPhoneController,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Shop Phone Number',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: shopPhonrController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Address',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Email',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Shop category',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: categoryController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Description',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: descriptionController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Minimum Delivery Price',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: minimumDeliveryPriceController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Price per km',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: pricePerkmController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Delivery time',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: deliveryTimeController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Minimum amount',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: minimumAmountController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'tax',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: taxController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'commission',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      CustomInputWidget(
                        controller: comissionController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Shop logo',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          pickLogo();
                        },
                        child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.blackColor.withOpacity(0.2)),
                            ),
                            child: logoPath == null
                                ? Center(child: Icon(Icons.camera_alt))
                                : Image.file(
                                    File(
                                      logoPath!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Shop Backgound image',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          pickbackGround();
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2)),
                          ),
                          child: backgroundPath == null
                              ? Center(child: Icon(Icons.camera_alt))
                              : Image.file(
                                  File(backgroundPath!.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Password',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      Obx(
                        () => CustomInputWidget(
                          controller: passwordController,
                          obscureText: _authController.isObscured.value,
                          onPressed: () {
                            // _authController.isObscured.value =
                            //     !_authController.isObscured.value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: Icon(
                              _authController.isObscured.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.blackColor),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(
                        () => CustomButtonWidget(
                          buttonText: 'Proceed',
                          isLoading: _authController.isLoading.value,
                          onPressed: () async {
                            FirebaseMessaging firebaseMessaging =
                                FirebaseMessaging.instance;
                            var deviceToken =
                                await firebaseMessaging.getToken();
                            var param = {
                              "name": shopNameController.text,
                              "shop_phone": shopPhonrController.text,
                              "description": descriptionController.text,
                              "category": categoryController.text,
                              "logo": base64Encode(logoImageBytes!),
                              "background": base64Encode(backgroundImageByte!),
                              "min_delivery_price":
                                  minimumDeliveryPriceController.text,
                              "price_km": pricePerkmController.text,
                              "delivery_time": deliveryTimeController.text,
                              "min_amount": minimumAmountController.text,
                              "tax": taxController.text,
                              "commission": comissionController.text,
                              "address": addressController.text,
                              "firstname": firstNameController.text,
                              "lastname": lastNameController.text,
                              "email": emailController.text,
                              "phone": personalPhoneController.text,
                              "password": passwordController.text,
                              "longitude": locationController.longitude,
                              "latitude": locationController.latitude,
                              "device_token": deviceToken
                            };

                            if (_registerKey.currentState!.validate()) {
                              _authController.createUserController(param);
                            }
                          },
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: AppColors.blackColor,
                            height: 1,
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Or',
                            style: AppStyles.poppinsText(
                                fontWeight: FontWeight.w300, size: 12),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            color: AppColors.mainRed,
                            height: 1,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Already have an account',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w300, size: 12),
                        ),
                      ),
                      CustomButtonWidget(
                          isLoading: false,
                          buttonText: 'Sign In',
                          textColor: AppColors.blackColor,
                          bgcolor: AppColors.whiteColor,
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
