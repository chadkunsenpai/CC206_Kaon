import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileSettingsPageScreen extends StatelessWidget {
  ProfileSettingsPageScreen({Key? key}) : super(key: key);
  TextEditingController priceController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController newpasswordController1 = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          key: _formKey,
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 25.v),
              child: Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Káon", style: theme.textTheme.displayMedium)),
                SizedBox(height: 18.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text("Edit  Profile",
                            style: theme.textTheme.titleLarge))),
                SizedBox(height: 15.v),
                _buildPrice(context),
                SizedBox(height: 16.v),
                _buildEmail(context),
                SizedBox(height: 16.v),
                _buildPassword(context),
                SizedBox(height: 16.v),
                _buildNewpassword(context),
                SizedBox(height: 16.v),
                _buildNewpassword1(context),
                Spacer(),
                SizedBox(height: 63.v),
                _buildSAVECHANGES(context)
              ]))),
    ));
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 2.h),
        child: CustomTextFormField(
            controller: priceController, hintText: "USERNAME".toUpperCase()));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 2.h),
        child: CustomTextFormField(
            controller: emailController,
            hintText: "EMAIL ADDRESS".toUpperCase(),
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 2.h),
        child: CustomTextFormField(
            controller: passwordController,
            hintText: "OLD PASSWORD".toUpperCase(),
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildNewpassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 2.h),
        child: CustomTextFormField(
            controller: newpasswordController,
            hintText: "NEW PASSWORD".toUpperCase(),
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildNewpassword1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 2.h),
        child: CustomTextFormField(
            controller: newpasswordController1,
            hintText: "CONFIRM NEW PASSWORD".toUpperCase(),
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSAVECHANGES(BuildContext context) {
    return CustomElevatedButton(
        text: "SAVE CHANGES".toUpperCase(),
        margin: EdgeInsets.symmetric(horizontal: 19.h),
        onPressed: () {
          onTapSAVECHANGES(context);
        });
  }

  /// Navigates to the homeMenuBarScreen when the action is triggered.
  onTapSAVECHANGES(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePage);
  }
}
