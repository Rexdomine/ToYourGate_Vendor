import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';
import 'package:tyg_vendor/features/menue/controller/menu.dart';

class CreateMenuScreen extends StatefulWidget {
  const CreateMenuScreen({super.key});

  @override
  State<CreateMenuScreen> createState() => _CreateMenuScreenState();
}

class _CreateMenuScreenState extends State<CreateMenuScreen> {
  List<File> _selectedImages = [];
  Future<void> _pickImages() async {
    if (_selectedImages.length >= 4) {
      // If the maximum number of images (4) is already selected, return without picking more.
      return;
    }
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        _selectedImages =
            pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Add a menu',
          style: AppStyles.poppinsText(
              fontWeight: FontWeight.w500,
              size: 14,
              color: AppColors.blackColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food Name',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(obscureText: false),
            SizedBox(
              height: 10,
            ),
            Text(
              'Price per unit',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(obscureText: false),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  border:
                      Border.all(color: AppColors.blackColor.withOpacity(0.4))),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Delivery time',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(obscureText: false),
            SizedBox(
              height: 10,
            ),
            Text(
              'Add ons',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            Row(children: [
              InkWell(
                onTap: () {
                  Get.bottomSheet(AddonWidget());
                },
                child: Icon(
                  Icons.add_outlined,
                  color: AppColors.redColor,
                ),
              ),
              menuController.addon.isEmpty
                  ? Text(
                      'tap the add icon',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w500,
                          size: 15,
                          color: AppColors.blackColor),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          indent: 5,
                        ),
                        itemCount: menuController.addon.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.mainRed),
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              menuController.addon[index],
                              style: AppStyles.poppinsText(
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      )),
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              'Menu images',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            _selectedImages.isEmpty
                ? GestureDetector(
                    onTap: () {
                      _pickImages();
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.mainRed,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(6),
                          child: Center(
                              child: Icon(
                            Icons.add_a_photo_rounded,
                            color: AppColors.whiteColor,
                          )),
                        ),
                      ],
                    ))
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: _selectedImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Image.file(
                              _selectedImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
            SizedBox(
              height: 50,
            ),
            CustomButtonWidget(
                buttonText: 'Upload Menu', onPressed: () {}, isLoading: false)
          ],
        ),
      ),
    );
  }
}

class AddonWidget extends StatefulWidget {
  const AddonWidget({
    super.key,
  });

  @override
  State<AddonWidget> createState() => _AddonWidgetState();
}

final menuController = Get.put(VendorMenuController());
TextEditingController adonTextController = TextEditingController();

class _AddonWidgetState extends State<AddonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColors.whiteColor),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 100,
              color: AppColors.redColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Menu add-on',
            style: AppStyles.poppinsText(
                fontWeight: FontWeight.w900,
                size: 15,
                color: AppColors.blackColor),
          ),
          SizedBox(
            height: 30,
          ),
          CustomInputWidget(
            obscureText: false,
            controller: adonTextController,
            hintText: 'Add-on',
          ),
          SizedBox(
            height: 20,
          ),
          CustomButtonWidget(
              buttonText: 'Add',
              onPressed: () {
                menuController.addon.add(adonTextController.text);
                Get.back();
                adonTextController.clear();
              },
              isLoading: false)
        ],
      ),
    );
  }
}
