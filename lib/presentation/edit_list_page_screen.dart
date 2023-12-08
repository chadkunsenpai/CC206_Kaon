import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditListPageScreen extends StatelessWidget {
  EditListPageScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController usernameController1 = TextEditingController();

  TextEditingController usernameController2 = TextEditingController();

  TextEditingController usernameController3 = TextEditingController();

  TextEditingController usernameController4 = TextEditingController();

  TextEditingController usernameController5 = TextEditingController();

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
              padding: EdgeInsets.symmetric(vertical: 1.v),
              child: Column(children: [
                SizedBox(height: 43.v),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 25.h, right: 25.h, bottom: 5.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: Text("Edit Food Log",
                                          style: CustomTextStyles
                                              .titleMediumBlack90001))),
                              SizedBox(height: 14.v),
                              _buildFive(context),
                              SizedBox(height: 26.v),
                              _buildName(context),
                              SizedBox(height: 17.v),
                              _buildPrice(context),
                              SizedBox(height: 17.v),
                              _buildUsername(context),
                              SizedBox(height: 17.v),
                              _buildUsername1(context),
                              SizedBox(height: 17.v),
                              _buildUsername2(context),
                              SizedBox(height: 17.v),
                              _buildUsername3(context),
                              SizedBox(height: 17.v),
                              _buildUsername4(context),
                              SizedBox(height: 17.v),
                              _buildUsername5(context),
                              SizedBox(height: 37.v),
                              _buildSAVECHANGES(context),
                              SizedBox(height: 17.v),
                              _buildDELETEFOODLOG(context)
                            ]))))
              ]))),
    ));
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 28.v),
        decoration: AppDecoration.fillGreen
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text("Ham and Egg with Rice",
                      style: CustomTextStyles.titleMediumWhiteA700))),
          SizedBox(height: 14.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text("Breakfast", style: theme.textTheme.labelLarge))),
          SizedBox(height: 38.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: _buildFrame(context,
                  userFat: "Calories", userWeight: "349 kcal")),
          SizedBox(height: 16.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: _buildFrame(context, userFat: "Fat", userWeight: "12 g")),
          SizedBox(height: 17.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: _buildFrame(context,
                  userFat: "Carbohydrates", userWeight: "44 g")),
          SizedBox(height: 14.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child:
                  _buildFrame(context, userFat: "Protein", userWeight: "8 g")),
          SizedBox(height: 16.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child:
                  _buildFrame(context, userFat: "Others", userWeight: "19 g")),
          SizedBox(height: 15.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: _buildFrame(context,
                  userFat: "Water Intake", userWeight: "2 cups")),
          SizedBox(height: 6.v)
        ]));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: nameController, hintText: "FOOD NAME".toUpperCase()));
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: priceController,
            hintText: "DESCRIPTION".toUpperCase()));
  }

  /// Section Widget
  Widget _buildUsername(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: usernameController,
            hintText: "TOTAL CALORIES".toUpperCase()));
  }

  /// Section Widget
  Widget _buildUsername1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: usernameController1,
            hintText: "CARBOHYDRATES".toUpperCase()));
  }

  /// Section Widget
  Widget _buildUsername2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: usernameController2,
            hintText: "PROTEIN".toUpperCase()));
  }

  /// Section Widget
  Widget _buildUsername3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: usernameController3, hintText: "FAT".toUpperCase()));
  }

  /// Section Widget
  Widget _buildUsername4(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: usernameController4, hintText: "OTHERS".toUpperCase()));
  }

  /// Section Widget
  Widget _buildUsername5(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: usernameController5,
            hintText: "WATER INTAKE".toUpperCase(),
            textInputAction: TextInputAction.done));
  }

  /// Section Widget
  Widget _buildSAVECHANGES(BuildContext context) {
    return CustomElevatedButton(
        text: "SAVE CHANGES".toUpperCase(),
        margin: EdgeInsets.only(left: 19.h, right: 20.h),
        onPressed: () {
          onTapSAVECHANGES(context);
        });
  }

  /// Section Widget
  Widget _buildDELETEFOODLOG(BuildContext context) {
    return CustomElevatedButton(
        text: "DELETE FOOD LOG".toUpperCase(),
        margin: EdgeInsets.only(left: 19.h, right: 20.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL41,
        onPressed: () {
          onTapDELETEFOODLOG(context);
        });
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String userFat,
    required String userWeight,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(userFat,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(userWeight,
          style: CustomTextStyles.titleMediumWhiteA700SemiBold
              .copyWith(color: appTheme.whiteA700))
    ]);
  }

  /// Navigates to the homeMenuBarScreen when the action is triggered.
  onTapSAVECHANGES(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePage);
  }

  /// Navigates to the homeMenuBarScreen when the action is triggered.
  onTapDELETEFOODLOG(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePage);
  }
}
