import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';

class SignUpPageFourScreen extends StatelessWidget {
  const SignUpPageFourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 41.h, vertical: 48.v),
                child: Column(children: [
                  Text("Káon", style: theme.textTheme.displayMedium),
                  SizedBox(height: 35.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgComponens226x230,
                      height: 226.v,
                      width: 230.h),
                  SizedBox(height: 16.v),
                  Text("ALL DONE!", style: theme.textTheme.headlineSmall),
                  SizedBox(height: 16.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 286.h,
                          margin: EdgeInsets.only(left: 21.h),
                          child: Text(
                              "Thanks for giving us your precious time! Now you are ready for a more healthier and productive life!",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .titleMediumMontserratOnPrimaryContainer))),
                  SizedBox(height: 99.v),
                  CustomElevatedButton(
                      text: "FINISH".toUpperCase(),
                      margin: EdgeInsets.symmetric(horizontal: 3.h),
                      onPressed: () {
                        onTapFINISH(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the homeMenuBarScreen when the action is triggered.
  onTapFINISH(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}
