import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tyg_vendor/features/authentication/presentation/shop_setup.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../controller/auth_controller.dart';
import 'login.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

String currentText = "";
TextEditingController pinTextController = TextEditingController();
final _authController = Get.put(AuthController());

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainRed,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            color: AppColors.mainRed,
            child: Center(
              child: Text(
                'ToYourGate',
                style: AppStyles.poppinsText(
                    fontWeight: FontWeight.w700,
                    size: 32,
                    color: AppColors.whiteColor),
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Verify your Email',
                    style: AppStyles.poppinsText(
                        fontWeight: FontWeight.w800,
                        size: 15,
                        color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter the verification code sent to your registered email',
                    style: AppStyles.poppinsText(
                        fontWeight: FontWeight.w300,
                        size: 13,
                        color: AppColors.blackColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PinCodeTextField(
                    length: 4,
                    obscureText: true,
                    controller: pinTextController,
                    animationType: AnimationType.fade,
                    obscuringCharacter: '*',
                    pinTheme: PinTheme(
                      disabledColor: AppColors.mainRed,
                      selectedFillColor: AppColors.mainRed,
                      activeColor: AppColors.mainRed,
                      inactiveFillColor: AppColors.whiteColor,
                      inactiveColor: AppColors.mainRed,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      selectedColor: AppColors.whiteColor,
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: AppColors.whiteColor,
                    ),
                    enablePinAutofill: true,
                    animationDuration: const Duration(milliseconds: 300),
                    keyboardType: TextInputType.text,
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        'Resend Code',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w400,
                            color: AppColors.redColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Obx(
                  //   () =>
                  CustomButtonWidget(
                      buttonText: 'Proceed',
                      isLoading: false,
                      onPressed: () {
                        Get.to(() => ShopSetUpScreen());
                        // _authController.verifyUserController(
                        //     pinTextController.text.trim());
                      }),
                  // )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
