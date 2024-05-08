import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tyg_vendor/features/profile/controller/profile.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../../../constants/location.dart';
import '../../authentication/presentation/login.dart';

class UpdateShopScreen extends StatefulWidget {
  const UpdateShopScreen({super.key});

  @override
  State<UpdateShopScreen> createState() => _UpdateShopScreenState();
}

File? _logoPath;
File? _backgroundPath;
List<int>? _logoImageBytes;
List<int>? _backgroundImageByte;

class _UpdateShopScreenState extends State<UpdateShopScreen> {
  final _profileController = Get.put(ProfileController());
  final locationController = Get.put(GetGeoLocation());
  final _registerKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _personalPhoneController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();
  TextEditingController _shopPhonrController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _minimumDeliveryPriceController =
      TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _pricePerkmController = TextEditingController();
  TextEditingController _deliveryTimeController = TextEditingController();
  TextEditingController _minimumAmountController = TextEditingController();
  TextEditingController _taxController = TextEditingController();
  TextEditingController _comissionController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<void> _pickLogo() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Do something with the picked image
      setState(() {
        _logoPath = File(image.path);
        _logoImageBytes = _logoPath!.readAsBytesSync();
      });
      print('Image path: ${image.path}');
    } else {
      // User canceled the picker
      print('No image selected.');
    }
  }

  Future<void> _pickbackGround() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Do something with the picked image
      setState(() {
        _backgroundPath = File(image.path);
        _backgroundImageByte = _backgroundPath!.readAsBytesSync();
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
          'Update shop',
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
                        controller: _shopNameController,
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
                        controller: _firstNameController,
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
                        controller: _lastNameController,
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
                        controller: _personalPhoneController,
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
                        controller: _shopPhonrController,
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
                        controller: _emailController,
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
                        controller: _categoryController,
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
                        controller: _descriptionController,
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
                        controller: _minimumDeliveryPriceController,
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
                        controller: _pricePerkmController,
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
                        controller: _deliveryTimeController,
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
                        controller: _minimumAmountController,
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
                        controller: _taxController,
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
                        controller: _comissionController,
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
                          _pickLogo();
                        },
                        child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.blackColor.withOpacity(0.2)),
                            ),
                            child: _logoPath == null
                                ? Center(child: Icon(Icons.camera_alt))
                                : Image.file(
                                    File(
                                      _logoPath!.path,
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
                          _pickbackGround();
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2)),
                          ),
                          child: _backgroundPath == null
                              ? Center(child: Icon(Icons.camera_alt))
                              : Image.file(
                                  File(_backgroundPath!.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(
                        () => CustomButtonWidget(
                          buttonText: 'Update ',
                          isLoading: _profileController.updatingShop.value,
                          onPressed: () async {
                            FirebaseMessaging firebaseMessaging =
                                FirebaseMessaging.instance;
                            var deviceToken =
                                await firebaseMessaging.getToken();
                            var param = {
                              "name": _shopNameController.text,
                              "shop_phone": _shopPhonrController.text,
                              "description": _descriptionController.text,
                              "category": _categoryController.text,
                              "logo": base64Encode(_logoImageBytes!),
                              "background": base64Encode(_backgroundImageByte!),
                              "min_delivery_price":
                                  _minimumDeliveryPriceController.text,
                              "price_km": _pricePerkmController.text,
                              "__delivery_time": _deliveryTimeController.text,
                              "_min_amount": _minimumAmountController.text,
                              "_tax": _taxController.text,
                              "_commission": _comissionController.text,
                              "_address": _addressController.text,
                              "firstname": _firstNameController.text,
                              "lastname": _lastNameController.text,
                              "email": _emailController.text,
                              "phone": _personalPhoneController.text,
                              "password": _passwordController.text,
                              "longitude": locationController.longitude,
                              "latitude": locationController.latitude,
                              "device_token": deviceToken
                            };

                            if (_registerKey.currentState!.validate()) {
                              _profileController.updateShop(param);
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
