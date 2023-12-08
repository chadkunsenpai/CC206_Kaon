import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';

class ForgotPasswordOneScreen extends StatefulWidget {
  ForgotPasswordOneScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordOneScreenState createState() =>
      _ForgotPasswordOneScreenState();
}

class _ForgotPasswordOneScreenState extends State<ForgotPasswordOneScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 50.v),
            child: Column(
              children: [
                Text("Káon", style: theme.textTheme.displayMedium),
                SizedBox(height: 48.v),
                Text("Forgot Password!", style: theme.textTheme.headlineSmall),
                SizedBox(height: 13.v),
                Container(
                  width: 274.h,
                  margin: EdgeInsets.symmetric(horizontal: 27.h),
                  child: Text(
                    "Don’t worry! Enter your registered email below to receive password reset instructions",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles
                        .titleMediumMontserratOnPrimaryContainer,
                  ),
                ),
                SizedBox(height: 6.v),
                CustomImageView(
                  imagePath: ImageConstant.imgLoginForgotPassword,
                  height: 182.v,
                  width: 173.h,
                ),
                SizedBox(height: 24.v),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "EMAIL ADDRESS".toUpperCase(),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
                ),
                SizedBox(height: 39.v),
                CustomElevatedButton(
                  text: "SUBMIT".toUpperCase(),
                  margin: EdgeInsets.symmetric(horizontal: 15.h),
                  onPressed: () {
                    // Call the password reset function here
                    passwordReset();
                  },
                ),
                SizedBox(height: 9.v),
                Padding(
                  padding: EdgeInsets.only(left: 26.h, right: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          "Remember Password? ",
                          style: CustomTextStyles
                              .titleMediumMontserratPrimaryContainer,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtSignIn(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 29.h),
                          child: Text(
                            "Sign In",
                            style:
                                CustomTextStyles.titleMediumMontserratTeal500,
                          ),
                        ),
                      ),
                    ],
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

// Password Reset Function
  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset link sent"),
          );
        },
      );

      // Redirect to forgotPasswordTwoScreen after password reset
      onTapSUBMIT(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  /// Navigates to the forgotPasswordTwoScreen when the action is triggered.
  onTapSUBMIT(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordTwoScreen);
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}
