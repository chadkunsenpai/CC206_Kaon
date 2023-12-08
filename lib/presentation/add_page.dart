import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/widgets/custom_elevated_button.dart';
import 'package:kaon/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  TextEditingController fnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController carbsController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController othersController = TextEditingController();
  TextEditingController waterController = TextEditingController();
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
                    decoration: AppDecoration.fillGray,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 21.h, vertical: 25.v),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text("Káon",
                                      style: theme.textTheme.displayMedium))),
                          SizedBox(height: 20.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Add Food Logs",
                                  style: theme.textTheme.titleLarge)),
                          SizedBox(height: 12.v),
                          _buildName(context),
                          SizedBox(height: 17.v),
                          _buildDescription(context),
                          SizedBox(height: 17.v),
                          _buildCalories(context),
                          SizedBox(height: 17.v),
                          _buildCarbs(context),
                          SizedBox(height: 17.v),
                          _buildProtein(context),
                          SizedBox(height: 17.v),
                          _buildFat(context),
                          SizedBox(height: 17.v),
                          _buildOthers(context),
                          SizedBox(height: 17.v),
                          _buildWater(context),
                          SizedBox(height: 55.v),
                          _buildADD(context),
                          SizedBox(height: 5.v)
                        ]))))));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: fnameController, hintText: "FOOD NAME".toUpperCase()));
  }

  /// Section Widget
  Widget _buildDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: descriptionController,
            hintText: "DESCRIPTION".toUpperCase()));
  }

  /// Section Widget
  Widget _buildCalories(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: caloriesController,
            hintText: "TOTAL CALORIES".toUpperCase()));
  }

  /// Section Widget
  Widget _buildCarbs(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: carbsController,
            hintText: "CARBOHYDRATES".toUpperCase()));
  }

  /// Section Widget
  Widget _buildProtein(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: proteinController, hintText: "PROTEIN".toUpperCase()));
  }

  /// Section Widget
  Widget _buildFat(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: fatController, hintText: "FAT".toUpperCase()));
  }

  /// Section Widget
  Widget _buildOthers(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: othersController, hintText: "OTHERS".toUpperCase()));
  }

  /// Section Widget
  Widget _buildWater(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: waterController,
            hintText: "WATER INTAKE".toUpperCase(),
            textInputAction: TextInputAction.done));
  }

  /// Section Widget
  Widget _buildADD(BuildContext context) {
    return CustomElevatedButton(
        text: "ADD".toUpperCase(),
        margin: EdgeInsets.only(left: 19.h, right: 29.h),
        onPressed: () {
          onTapADD(context);
        });
  }

  /// Navigates to the homeMenuBarScreen when the action is triggered.
  onTapADD(BuildContext context) {
    if (fnameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        caloriesController.text.isEmpty ||
        carbsController.text.isEmpty ||
        proteinController.text.isEmpty ||
        fatController.text.isEmpty ||
        othersController.text.isEmpty ||
        waterController.text.isEmpty) {
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
      return;
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucess'),
            content: Text('Food Added'),
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
    if (_formKey.currentState!.validate()) {
      // Form is valid, send data to Firebase
      _addToFirebase(context);
      Navigator.pushNamed(context, AppRoutes.homePage);
    }
  }

  // Function to add data to Firebase
  void _addToFirebase(context) {
    String? userId = getCurrentUserId();
    print("User $userId");
    if (userId == null) {
      print("User not authenticated");
      return;
    }

    // Reference to the user's collection and the nested foodLogs collection
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    CollectionReference foodLogsCollection =
        userCollection.doc(userId).collection('foodLogs');

    foodLogsCollection.add({
      'fname': fnameController.text,
      'description': descriptionController.text,
      'calories': caloriesController.text,
      'carbs': carbsController.text,
      'protein': proteinController.text,
      'fat': fatController.text,
      'others': othersController.text,
      'water': waterController.text,
    }).then((DocumentReference document) {
      Navigator.pushNamed(context, AppRoutes.homePage);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error adding data to Firebase: $error'),
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
    });
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }
}
