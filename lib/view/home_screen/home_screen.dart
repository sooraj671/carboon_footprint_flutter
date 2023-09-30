import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:footprint/controllers/auth_controller.dart';
import 'package:footprint/controllers/data_controller.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/services/auth_service.dart';
import 'package:footprint/view/app_widgets/custom_background.dart';
import 'package:footprint/view/household_screen/household_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.green,
            icon: Icon(Icons.logout), // Use the logout icon
            onPressed: () async {
              Get.put(AuthController());

              // Call the signOutUser function to perform logout
              await AuthService.signOutUser();
              // You can also navigate to a different screen or perform other actions after logout.
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Let’s get started',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'Take a short assessment to get started',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: ()  async {
              fetchAllTotalFields();
              Get.to(HouseholdScreen());
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(203, 49),
                backgroundColor: ColorName.buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(47))),
            child: Text('Today’s Assessment'),
          ),
        ],
      ),
    );
  }
}
