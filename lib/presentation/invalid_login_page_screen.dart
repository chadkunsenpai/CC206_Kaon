import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class InvalidLoginPageScreen extends StatelessWidget {
  InvalidLoginPageScreen({Key? key}) : super(key: key);

  TextEditingController priceController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    height: 839.v,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.topCenter, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage1,
                          height: 319.v,
                          width: 389.h,
                          alignment: Alignment.bottomCenter),
                      Align(
                          alignment: Alignment.topCenter,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgVector,
                                height: 229.v,
                                width: 389.h),
                            SizedBox(height: 5.v),
                            Text("Káon", style: theme.textTheme.displayLarge),
                            SizedBox(height: 25.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 33.h, right: 27.h),
                                child: CustomTextFormField(
                                    controller: priceController,
                                    hintText: "USERNAME".toUpperCase())),
                            SizedBox(height: 20.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 33.h, right: 27.h),
                                child: CustomTextFormField(
                                    controller: passwordController,
                                    hintText: "PASSWORD".toUpperCase(),
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true)),
                            SizedBox(height: 4.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 33.h),
                                    child: Text("Invalid username/password",
                                        style: CustomTextStyles
                                            .labelLargeMontserratRedA400))),
                            SizedBox(height: 18.v),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtForgotPassword(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 27.h),
                                        child: Text("Forgot password?",
                                            style: CustomTextStyles
                                                .titleMediumMontserratPrimaryContainer)))),
                            SizedBox(height: 79.v),
                            CustomElevatedButton(
                                text: "LOGIN".toUpperCase(),
                                margin:
                                    EdgeInsets.only(left: 45.h, right: 44.h),
                                buttonStyle: CustomButtonStyles.outlinePrimary,
                                buttonTextStyle: CustomTextStyles
                                    .titleMediumMontserratPrimary,
                                onPressed: () {
                                  onTapLOGIN(context);
                                }),
                            SizedBox(height: 7.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 53.h, right: 61.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text("Don’t have an account?",
                                              style: CustomTextStyles
                                                  .titleMediumMontserratPrimaryContainer)),
                                      GestureDetector(
                                          onTap: () {
                                            onTapTxtSignUp(context);
                                          },
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18.h),
                                              child: Text("Sign Up",
                                                  style: CustomTextStyles
                                                      .titleMediumMontserratWhiteA700)))
                                    ]))
                          ]))
                    ])))));
  }

  /// Navigates to the forgotPasswordOneScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordOneScreen);
  }

  /// Navigates to the homeMenuBarScreen when the action is triggered.
  onTapLOGIN(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeMenuBarScreen);
  }

  /// Navigates to the signUpPageOneScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageOneScreen);
  }
}
