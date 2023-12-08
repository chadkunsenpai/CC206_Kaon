import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';

class ForgotPasswordTwoScreen extends StatelessWidget {
  const ForgotPasswordTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 45.h, vertical: 51.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 86.h),
                          child: Text("Káon",
                              style: theme.textTheme.displayMedium))),
                  SizedBox(height: 45.v),
                  Text("EMAIL SENT!", style: theme.textTheme.headlineSmall),
                  SizedBox(height: 15.v),
                  Container(
                      width: 292.h,
                      margin: EdgeInsets.symmetric(horizontal: 3.h),
                      child: Text("We’ve sent a password reset to your\nemail!",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles
                              .titleMediumMontserratOnPrimaryContainer)),
                  SizedBox(height: 27.v),
                  SizedBox(
                      height: 229.v,
                      width: 218.h,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLoginForgotPassword,
                            height: 229.v,
                            width: 218.h,
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 9.v),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Didn’t Receive?",
                                          style: CustomTextStyles
                                              .labelLargeMontserratPrimaryContainer),
                                      Padding(
                                          padding: EdgeInsets.only(left: 16.h),
                                          child: Text("Resend",
                                              style: CustomTextStyles
                                                  .labelLargeMontserratTeal500))
                                    ])))
                      ])),
                  SizedBox(height: 60.v),
                  CustomElevatedButton(
                      text: "BACK TO LOGIN".toUpperCase(),
                      onPressed: () {
                        onTapBACKTOLOGIN(context);
                      }),
                  SizedBox(height: 9.v),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 15.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: Text("Sign Up",
                                    style: CustomTextStyles
                                        .titleMediumMontserratTeal500))
                          ])),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapBACKTOLOGIN(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }

  /// Navigates to the signUpPageOneScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageOneScreen);
  }
}
