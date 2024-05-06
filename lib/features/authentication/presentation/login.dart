import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/features/bottom%20navigation/presentation/bottom_nav.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../controller/auth_controller.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _authController = Get.put(AuthController());
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Form(
        key: _loginKey,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: AppColors.mainRed,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset('assets/images/logo.png'),
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
                        'Welcome!',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w800,
                            size: 22,
                            color: AppColors.blackColor),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Please Key in your details to proceed',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300,
                            size: 16,
                            color: AppColors.blackColor),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                      controller: _emailTextController,
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
                        controller: _passwordTextController,
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
                        buttonText: 'Login',
                        isLoading: _authController.loginUser.value,
                        onPressed: () {
                          Get.to(() => BottomNavigationScreen());
                          // if (_loginKey.currentState!.validate()) {
                          //   _authController.loginUserController(
                          //       _emailTextController.text.trim(),
                          //       _passwordTextController.text.trim());
                          // }
                        },
                      ),
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
                        'Dont have an account',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w300, size: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButtonWidget(
                        isLoading: false,
                        buttonText: 'Sign up',
                        textColor: AppColors.blackColor,
                        bgcolor: AppColors.whiteColor,
                        onPressed: () {
                          Get.to(() => RegisterScreen());
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

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.bgcolor,
    this.textColor,
    required this.isLoading,
  });
  final String buttonText;
  final VoidCallback onPressed;
  final Color? bgcolor;
  final Color? textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgcolor ?? AppColors.mainRed),
        child: Center(
          child: isLoading
              ? const CustomLoaderWidget()
              : Text(
                  buttonText,
                  style: AppStyles.poppinsText(
                      fontWeight: FontWeight.w500,
                      size: 14,
                      color: textColor ?? AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}

class CustomLoaderWidget extends StatelessWidget {
  final Color? color;
  const CustomLoaderWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: color ?? AppColors.whiteColor,
        strokeWidth: 3,
      ),
    );
  }
}

class CustomInputWidget extends StatelessWidget {
  final controller;
  final keyboardType;
  final hintText;
  final bool obscureText;
  final Icon? suffixIcon;

  final VoidCallback? onPressed;
  const CustomInputWidget({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      style: AppStyles.poppinsText(
          fontWeight: FontWeight.w500, size: 14, color: AppColors.blackColor),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field Cannot be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(13),
          suffixIcon: suffixIcon == null
              ? const SizedBox.shrink()
              : InkWell(onTap: onPressed, child: suffixIcon),
          isDense: true,
          border: InputBorder.none,
          enabled: true,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColors.blackColor.withOpacity(0.3))),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColors.blackColor.withOpacity(0.3))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColors.blackColor.withOpacity(0.3))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColors.blackColor.withOpacity(0.3))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.redColor))),
    );
  }
}
