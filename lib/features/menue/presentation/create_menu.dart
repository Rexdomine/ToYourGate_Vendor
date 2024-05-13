import 'dart:io';

import 'package:flutter/material.dart';
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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _desController = TextEditingController();
  TextEditingController _deliveryTimeController = TextEditingController();
  TextEditingController _minQuantityController = TextEditingController();
  TextEditingController _maxQuantityController = TextEditingController();
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
            CustomInputWidget(
              obscureText: false,
              controller: _nameController,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Price per unit',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: _priceController,
            ),
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
                controller: _desController,
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
              'Quantity',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: _quantityController,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Delivery time',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: _deliveryTimeController,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Max Quantity ',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: _maxQuantityController,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Min Quantity',
              style:
                  AppStyles.poppinsText(fontWeight: FontWeight.w300, size: 12),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: _minQuantityController,
            ),
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
                      child: Obx(
                        () => menuController.loading.value
                            ? SizedBox()
                            : ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                      indent: 5,
                                    ),
                                itemCount: menuController
                                    .loadedAdons.value.data!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var addedAdons = menuController
                                      .loadedAdons.value.data![index];

                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.mainRed),
                                    padding: EdgeInsets.all(5),
                                    child: Center(
                                      child: Text(
                                        addedAdons.name ?? "",
                                        style: AppStyles.poppinsText(
                                            fontWeight: FontWeight.w500,
                                            size: 14,
                                            color: AppColors.whiteColor),
                                      ),
                                    ),
                                  );
                                }),
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
            Obx(
              () => CustomButtonWidget(
                  buttonText: 'Upload Menu',
                  onPressed: () {
                    var menu = {
                      "name": _nameController.text,
                      "description": _desController.text,
                      "quantity": _quantityController.text,
                      "price": priceController.text,
                      "min_qty": _minQuantityController.text,
                      "max_qty": _maxQuantityController.text,
                      "image": _selectedImages.first.path,
                      "addons": [menuController.addonList]
                    };

                    menuController.createMenuController(menu);
                  },
                  isLoading: menuController.creatingMenu.value),
            )
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
TextEditingController nameController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();

class _AddonWidgetState extends State<AddonWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: AppColors.whiteColor),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: Text(
                'Menu add-on',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w900,
                    size: 15,
                    color: AppColors.blackColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Name',
              style: AppStyles.poppinsText(
                  fontWeight: FontWeight.w400,
                  size: 13,
                  color: AppColors.blackColor),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: nameController,
              hintText: 'name',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Description',
              style: AppStyles.poppinsText(
                  fontWeight: FontWeight.w400,
                  size: 13,
                  color: AppColors.blackColor),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: descController,
              hintText: 'description',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Price',
              style: AppStyles.poppinsText(
                  fontWeight: FontWeight.w400,
                  size: 13,
                  color: AppColors.blackColor),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: priceController,
              keyboardType: TextInputType.number,
              hintText: 'price',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Quantity',
              style: AppStyles.poppinsText(
                  fontWeight: FontWeight.w400,
                  size: 13,
                  color: AppColors.blackColor),
            ),
            CustomInputWidget(
              obscureText: false,
              controller: quantityController,
              hintText: 'Quantity',
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => CustomButtonWidget(
                  buttonText: 'Add',
                  onPressed: () {
                    var param = {
                      "name": nameController.text,
                      "description": descController.text,
                      "price": priceController.text,
                      "quantity": quantityController.text,
                      "image": ""
                    };

                    menuController.addon.add(nameController.text);
                    // Get.back();
                    nameController.clear();
                    menuController.createAddonController(param);
                  },
                  isLoading: menuController.adding.value),
            )
          ],
        ),
      ),
    );
  }
}
