// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/app_bar/app_bar.dart';

class AboutSettingsPageScreen extends StatelessWidget {
  AboutSettingsPageScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 44.h,
            vertical: 16.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgComponens270x253,
                height: 270.v,
                width: 253.h,
                margin: EdgeInsets.only(left: 16.h),
              ),
              SizedBox(height: 24.v),
              SizedBox(
                width: 299.h,
                child: Text(
                  "Káon is a calorie tracker application can be a helpful tool for individuals who want to maintain a healthy diet, lose weight, or monitor their caloric intake for medical reasons. By providing an easy way to track and monitor food intake, these apps can help users make more informed decisions about their diet and lifestyle.",
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style:
                      CustomTextStyles.titleMediumMontserratOnPrimaryContainer,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarSubtitle(
        text: "About",
        margin: EdgeInsets.only(left: 57.h),
      ),
      actions: [
        AppbarTitle(
          text: "Káon",
          margin: EdgeInsets.only(
            left: 28.h,
            right: 71.h,
            bottom: 1.v,
          ),
        ),
      ],
    );
  }
}
