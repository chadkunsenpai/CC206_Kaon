import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
          future: _getFirestoreData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoading();
            } else if (snapshot.hasError) {
              return _buildError(snapshot.error.toString());
            } else {
              Map<String, dynamic> data = snapshot.data!;
              return _buildContent(context, data);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text('Error: $error'),
    );
  }

  Widget _buildContent(BuildContext context, Map<String, dynamic> data) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillGray,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.v),
        child: Column(
          children: [
            _buildHeaderText(context),
            SizedBox(height: 20.v),
            _buildDailySummary(context, data),
            SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      "Káon",
      style: theme.textTheme.displayMedium,
    );
  }

  Widget _buildDailySummary(BuildContext context, Map<String, dynamic> data) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, "Your Daily Summary"),
          SizedBox(height: 9.v),
          _buildFoodIntake(context, data['calories']),
          SizedBox(height: 11.v),
          _buildSmallItem(context, data['carbs'], data['protein'], data['fat'],
              data['others']),
          SizedBox(height: 11.v),
          _buildWaterIntake(context, data['water']),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 3.h),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  Widget _buildFoodIntake(BuildContext context, int calories) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.lightGreen100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Container(
        height: 232.v,
        width: 342.h,
        padding: EdgeInsets.symmetric(vertical: 38.v),
        decoration: AppDecoration.fillLightGreen.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder18,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 49.v),
                child: Text(
                  "Total Calories",
                  style: CustomTextStyles.titleMediumRubikPrimaryContainer,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 38.v),
                child: Text(
                  calories.toString(),
                  style: theme.textTheme.displaySmall,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 21.v),
                child: Text(
                  "kcal",
                  style: CustomTextStyles.titleSmallBold,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgStyle7Copy,
              height: 149.v,
              width: 171.h,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallItem(
      BuildContext context, int carbs, int protein, int fat, int others) {
    return SizedBox(
      height: 132.v,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        scrollDirection: Axis.horizontal,
        children: [
          _buildSmallItemBox(
            title: "Carbs",
            value: carbs.toString(),
            unit: "g",
            color: appTheme.blue80030,
          ),
          SizedBox(width: 10.h),
          _buildSmallItemBox(
            title: "Protein",
            value: protein.toString(),
            unit: "g",
            color: appTheme.blue80030,
          ),
          SizedBox(width: 10.h),
          _buildSmallItemBox(
            title: "Fats",
            value: fat.toString(),
            unit: "g",
            color: appTheme.blue80030,
          ),
          SizedBox(width: 10.h),
          _buildSmallItemBox(
            title: "Others",
            value: others.toString(),
            unit: "g",
            color: appTheme.blue80030,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallItemBox({
    required String title,
    required String value,
    required String unit,
    required Color color,
  }) {
    return Container(
      width: 78.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 15.v,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: CustomTextStyles.bodyMediumRubikPrimaryContainer,
          ),
          SizedBox(height: 7.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(width: 4.h),
              Text(
                unit,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaterIntake(BuildContext context, int water) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.green300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Container(
        height: 232.v,
        width: 342.h,
        padding: EdgeInsets.symmetric(vertical: 38.v),
        decoration: AppDecoration.fillLightGreen.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder18,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 49.v),
                child: Text(
                  "Water Intake",
                  style: CustomTextStyles.titleMediumRubikPrimaryContainer,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 38.v),
                child: Text(
                  water.toString(),
                  style: theme.textTheme.displaySmall,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 21.v),
                child: Text(
                  "cups",
                  style: CustomTextStyles.titleSmallBold,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgStyle7Copy,
              height: 149.v,
              width: 171.h,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _getFirestoreData(BuildContext context) async {
    try {
      String? userId = getCurrentUserId();
      if (userId == null) {
        return {
          'calories': 1,
          'carbs': 1,
          'protein': 1,
          'fat': 1,
          'others': 1,
          'water': 1,
        };
      }

      CollectionReference foodLogCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('foodLogs');

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await foodLogCollection.get() as QuerySnapshot<Map<String, dynamic>>;

      if (querySnapshot.docs.isEmpty) {
        return {
          'calories': 0,
          'carbs': 0,
          'protein': 0,
          'fat': 0,
          'others': 0,
          'water': 0,
        };
      }

      int totalCalories = 0;
      int carbs = 0;
      int protein = 0;
      int fats = 0;
      int others = 0;
      int waterIntake = 0;

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> data = document.data();
        totalCalories += int.parse(data['calories'].toString());
        carbs += int.parse(data['carbs'].toString());
        protein += int.parse(data['protein'].toString());
        fats += int.parse(data['fat'].toString());
        others += int.parse(data['others'].toString());
        waterIntake += int.parse(data['water'].toString());
      }

      return {
        'calories': totalCalories,
        'carbs': carbs,
        'protein': protein,
        'fat': fats,
        'others': others,
        'water': waterIntake,
      };
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }
}
