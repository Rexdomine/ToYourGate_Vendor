import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/features/authentication/controller/auth_controller.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import 'otp_verification.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _authController = Get.put(AuthController());
  final _registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Form(
        key: _registerKey,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: AppColors.mainRed,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'TO YOUR GATE',
                  style: AppStyles.poppinsText(
                      fontWeight: FontWeight.w700,
                      size: 38,
                      color: AppColors.whiteColor),
                ),
                // child: Center(
                //   child: Image.asset('assets/images/vendor.png'),
                // ),
              ),
            ),
            Expanded(
                child: Container(
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
                      'Full  name',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w300,
                          size: 13,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomInputWidget(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Phone Number',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w300,
                          size: 13,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomInputWidget(
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Email',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w300,
                          size: 13,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomInputWidget(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Password',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w300,
                          size: 13,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => CustomInputWidget(
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
                    // Obx(
                    //   () =>
                    CustomButtonWidget(
                      buttonText: 'Proceed',
                      isLoading: false,
                      onPressed: () {
                        Get.to(() => OtpVerificationScreen());
                        // if (_loginKey.currentState!.validate()) {
                        //   _authController.loginUserController(
                        //       _emailTextController.text.trim(),
                        //       _passwordTextController.text.trim());
                        // }
                      },
                      // ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          'Forgot password?',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w300,
                              size: 14,
                              color: AppColors.blackColor),
                        )
                      ],
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
            ))
          ],
        ),
      ),
    );
  }
}
