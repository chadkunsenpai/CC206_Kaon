import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';

class SignUpPageTwoScreen extends StatelessWidget {
  const SignUpPageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 48.v),
                child: Column(children: [
                  Text("Káon", style: theme.textTheme.displayMedium),
                  SizedBox(height: 48.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgComponens,
                      height: 209.v,
                      width: 243.h),
                  SizedBox(height: 7.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 280.h,
                          margin: EdgeInsets.only(left: 23.h),
                          child: Text(
                              "Before we finish, please make sure that you read the and accept our terms of service, conditions, and privacy policy.",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .titleMediumMontserratOnPrimaryContainer))),
                  Spacer(flex: 55),
                  CustomElevatedButton(
                      text: "ACCEPT".toUpperCase(),
                      onPressed: () {
                        onTapACCEPT(context);
                      }),
                  SizedBox(height: 14.v),
                  GestureDetector(
                      onTap: () {
                        onTapTxtTermAndCondition(context);
                      },
                      child: Text("Terms and Conditions",
                          style:
                              CustomTextStyles.titleMediumMontserratTeal500)),
                  Spacer(flex: 44)
                ]))));
  }

  /// Navigates to the signUpPageFourScreen when the action is triggered.
  onTapACCEPT(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageFourScreen);
  }

  /// Navigates to the signUpPageThreeScreen when the action is triggered.
  onTapTxtTermAndCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageThreeScreen);
  }
}
