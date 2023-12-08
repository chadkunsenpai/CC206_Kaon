import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
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
            width: double.maxFinite,
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 229.v,
                  width: 389.h,
                ),
                SizedBox(height: 5.v),
                Text("Káon", style: theme.textTheme.displayLarge),
                SizedBox(height: 49.v),
                SizedBox(
                  height: 465.v,
                  width: 389.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage1,
                        height: 319.v,
                        width: 389.h,
                        alignment: Alignment.bottomCenter,
                      ),
                      _buildForm(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 33.h, right: 27.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: "EMAIL".toUpperCase(),
            ),
            SizedBox(height: 20.v),
            CustomTextFormField(
              controller: passwordController,
              hintText: "PASSWORD".toUpperCase(),
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(height: 5.v),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  onTapTxtForgotPassword(context);
                },
                child: Text(
                  "Forgot password?",
                  style: CustomTextStyles.titleMediumMontserratPrimaryContainer,
                ),
              ),
            ),
            SizedBox(height: 87.v),
            CustomElevatedButton(
              text: "LOGIN".toUpperCase(),
              margin: EdgeInsets.only(left: 11.h, right: 17.h),
              buttonStyle: CustomButtonStyles.outlinePrimary,
              buttonTextStyle: CustomTextStyles.titleMediumMontserratPrimary,
              onPressed: () async {
                await onTapLOGIN(context);
              },
            ),
            SizedBox(height: 7.v),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 25.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "Don’t have an account?",
                        style: CustomTextStyles
                            .titleMediumMontserratPrimaryContainer,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapTxtSignUp(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 18.h),
                        child: Text(
                          "Sign Up",
                          style:
                              CustomTextStyles.titleMediumMontserratWhiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordOneScreen);
  }

  onTapLOGIN(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incomplete Fields'),
            content: Text('Please fill out both email and password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      // Use Firebase Authentication for login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Successful login
      Navigator.pushNamed(context, AppRoutes.homeMenuBarScreen);
    } catch (e) {
      // Failed login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid credentials'),
            content: Text('Please enter the correct information'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // Clear controllers after a failed login
      emailController.clear();
      passwordController.clear();
    }
  }

  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageOneScreen);
  }
}
