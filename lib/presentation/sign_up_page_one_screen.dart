import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: must_be_immutable
class SignUpPageOneScreen extends StatelessWidget {
  SignUpPageOneScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
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
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.h, vertical: 48.v),
                        decoration: AppDecoration.fillGray,
                        child: Column(children: [
                          Text("Káon", style: theme.textTheme.displayMedium),
                          Spacer(flex: 33),
                          _buildName(context),
                          SizedBox(height: 16.v),
                          _buildEmail(context),
                          SizedBox(height: 16.v),
                          _buildPrice(context),
                          SizedBox(height: 16.v),
                          _buildPassword(context),
                          Spacer(flex: 36),
                          _buildNEXT(context),
                          SizedBox(height: 17.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an Account?",
                                        style: CustomTextStyles
                                            .titleMediumMontserratPrimaryContainer),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtSignIn(context);
                                        },
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.h),
                                            child: Text("Sign In",
                                                style: CustomTextStyles
                                                    .titleMediumMontserratTeal500)))
                                  ])),
                          Spacer(flex: 29)
                        ]))))));
  }

  // Function to register user using Firestore
  Future<void> registerUser(context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Add user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'username': usernameController.text,
      });

      // Navigate to the next screen
      onTapNEXT(context);
    } catch (e) {
      // Registration failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('$e'),
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
    }
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
        controller: nameController, hintText: "NAME".toUpperCase());
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "EMAIL ADDRESS".toUpperCase(),
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return CustomTextFormField(
        controller: usernameController, hintText: "USERNAME".toUpperCase());
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "PASSWORD".toUpperCase(),
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true);
  }

  /// Section Widget
  Widget _buildNEXT(BuildContext context) {
    return CustomElevatedButton(
      text: "NEXT".toUpperCase(),
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      onPressed: () {
        if (nameController.text.isEmpty ||
            emailController.text.isEmpty ||
            usernameController.text.isEmpty ||
            passwordController.text.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Incomplete Fields'),
                content: Text('Please fill out all fields.'),
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
        } else {
          registerUser(context);
        }
      },
    );
  }

  /// Navigates to the signUpPageTwoScreen when the action is triggered.
  onTapNEXT(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageTwoScreen);
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}
