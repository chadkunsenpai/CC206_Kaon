import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loginPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Invalid Login Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.invalidLoginPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home Menu Bar",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homeMenuBarScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot Password One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot Password Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up Page One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpPageOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up Page Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpPageTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up Page Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpPageThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up Page Four",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpPageFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile Settings Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileSettingsPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "About Settings Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.aboutSettingsPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit List Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editListPageScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
