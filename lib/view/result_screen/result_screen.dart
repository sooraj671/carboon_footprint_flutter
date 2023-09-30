import 'package:flutter/material.dart';
import 'package:footprint/controllers/auth_controller.dart';
import 'package:footprint/controllers/calculations.dart';
import 'package:footprint/controllers/data_controller.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/view/app_widgets/result_widget.dart';
import 'package:footprint/view/transport_screen/transport_screen.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorName.buttonColor),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
        child: Column(
          children: [
            Center(
              child: Text(
                'The average carbon footprint is $avg and your carbon footprint is $status',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Your total carbon footprint is ${totalCarbonFootprint}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CarbonFootprintProgress(),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ColorName.buttonColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "You are a green hero! Your low-carbon choices help the planet and inspire others. Thank you for your amazing actions! 🌱",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarbonFootprintProgress extends StatelessWidget {
  // final double progressPercentage = 75.0; // Replace with your actual progress percentage

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Household Carbon Footprint ${householdFootprint.toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        // Add spacing between label and progress bar
        LinearProgressIndicator(
          value: householdFootprint / 100.0,
          // Divide by 100 to convert to a 0-1 range
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          // Change the color as needed
          backgroundColor: Colors.grey,
        ),
        SizedBox(height: 58.0),
        // Add spacing between progress bar and percentage text
        Text(
          'Electricity Carbon Footprint ${energyFootprint.toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        // Add spacing between label and progress bar
        LinearProgressIndicator(
          value: energyFootprint / 100.0,
          // Divide by 100 to convert to a 0-1 range
          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          // Change the color as needed
          backgroundColor: Colors.grey,
        ),
        SizedBox(height: 58.0),
        // Add spacing between progress bar and percentage text
        Text(
          'Transport Carbon Footprint ${travelFootprint.toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        // Add spacing between label and progress bar
        LinearProgressIndicator(
          value: travelFootprint / 100.0,
          // Divide by 100 to convert to a 0-1 range
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
          // Change the color as needed
          backgroundColor: Colors.grey,
        ),
      ],
    );
  }
}
