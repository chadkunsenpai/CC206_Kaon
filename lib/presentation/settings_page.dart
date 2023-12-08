import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Container(
            padding: EdgeInsets.all(25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Káon", style: theme.textTheme.displayMedium),
                SizedBox(height: 8.v),
                Text("Settings", style: theme.textTheme.titleLarge),
                SizedBox(height: 39.v),
                Padding(
                  padding: EdgeInsets.only(right: 31.h),
                  child: _buildInfo(
                    context,
                    userImage: ImageConstant.imgIconlyLightOutlineProfile,
                    about: "Profile",
                    onTap: () {
                      onTapProfile(context);
                    },
                  ),
                ),
                SizedBox(height: 37.v),
                Padding(
                  padding: EdgeInsets.only(right: 31.h),
                  child: _buildInfo(
                    context,
                    userImage: ImageConstant.imgInfo,
                    about: "About",
                    onTap: () {
                      onTapAbout(context);
                    },
                  ),
                ),
                SizedBox(height: 38.v),
                Padding(
                  padding: EdgeInsets.only(right: 31.h),
                  child: _buildInfo(
                    context,
                    userImage: ImageConstant.imgArrowRight,
                    about: "Logout",
                    onTap: () {
                      _showLogoutConfirmationDialog(context);
                    },
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(
    BuildContext context, {
    required String userImage,
    required String about,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: Colors.transparent,
        elevation: 0,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: userImage,
            height: 26.adaptSize,
            width: 26.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h, top: 2.v),
            child: Text(
              about,
              style:
                  CustomTextStyles.titleLargePlusJakartaSansBlack900.copyWith(
                color: appTheme.black900,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgIconlyLightOu,
            height: 30.v,
            width: 11.h,
          ),
        ],
      ),
    );
  }

  void onTapProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileSettingsPageScreen);
  }

  void onTapAbout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aboutSettingsPageScreen);
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onTapLogOut(context);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  Future<void> onTapLogOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}
