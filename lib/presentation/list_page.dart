import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? userId = getCurrentUserId();
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .collection('foodLogs')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text("Input your first food log"),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var foodLog = snapshot.data!.docs[index];
                    return _buildFoodContainer(context, foodLog);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFoodContainer(
      BuildContext context, QueryDocumentSnapshot foodLog) {
    String fname = foodLog['fname'];
    String description = foodLog['description'];
    String calories = foodLog['calories'];
    String carbs = foodLog['carbs'];
    String fat = foodLog['fat'];
    String protein = foodLog['protein'];
    String others = foodLog['others'];
    String water = foodLog['water'];

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildText(context, "Food Name", fname),
            SizedBox(height: 14),
            _buildText(context, "Description", description),
            SizedBox(height: 38),
            _buildFrame(context,
                fatLabel: "Calories", weightLabel: "$calories kcal"),
            SizedBox(height: 16),
            _buildFrame(context,
                fatLabel: "Carbohydrates", weightLabel: "$carbs g"),
            SizedBox(height: 17),
            _buildFrame(context,
                fatLabel: "Protein", weightLabel: "$protein g"),
            SizedBox(height: 14),
            _buildFrame(context, fatLabel: "Fat", weightLabel: "$fat g"),
            SizedBox(height: 16),
            _buildFrame(context, fatLabel: "Others", weightLabel: "$others g"),
            SizedBox(height: 15),
            _buildFrame(context,
                fatLabel: "Water Intake", weightLabel: "$water cups"),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, String label, String value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 2),
        child: Text(
          "$label: $value",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildFrame(
    BuildContext context, {
    required String fatLabel,
    required String weightLabel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fatLabel,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          weightLabel,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  /// Navigates to the editListPageScreen when the action is triggered.
  onTapFoodContainer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editListPageScreen);
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }
}
