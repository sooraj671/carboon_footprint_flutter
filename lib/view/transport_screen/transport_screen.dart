import 'package:flutter/material.dart';
import 'package:footprint/controllers/data_controller.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/services/auth_service.dart';
import 'package:footprint/view/app_widgets/custom_background.dart';
import 'package:footprint/view/result_screen/result_screen.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/calculations.dart';

String status = "lower";

class TransportScreen extends StatefulWidget {
  const TransportScreen({super.key});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  String dropDownValue = "Coal";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController intercityTrainController = TextEditingController();
  TextEditingController subwayController = TextEditingController();
  TextEditingController intercityBusController = TextEditingController();
  TextEditingController cityBusController = TextEditingController();
  TextEditingController tramController = TextEditingController();
  TextEditingController bikeWalkController = TextEditingController();
  TextEditingController motorbikeController = TextEditingController();
  TextEditingController carController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.directions_bike_rounded,
                    size: 30,
                    color: ColorName.buttonColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'HOW DO YOU GET AROUND?',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(
                color: ColorName.buttonColor,
                thickness: 1,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Intercity Train',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: intercityTrainController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Subway',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: subwayController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Intercity Bus',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: intercityBusController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'City Bus',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: cityBusController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tram',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: tramController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Bike/walk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: bikeWalkController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'MotorBike',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: motorbikeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Car',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: carController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateField(value);
                },
                decoration: InputDecoration(
                  suffixText: "hours/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (intercityTrainController.value.text != "") {
                          intercityTrainHoursPerWeek =
                              double.parse(intercityTrainController.value.text);
                        }
                        if (subwayController.value.text != "") {
                          subwayHoursPerWeek =
                              double.parse(subwayController.value.text);
                        }
                        if (intercityBusController.value.text != "") {
                          intercityBusHoursPerWeek =
                              double.parse(intercityBusController.value.text);
                        }
                        if (cityBusController.value.text != "") {
                          cityBusHoursPerWeek =
                              double.parse(cityBusController.value.text);
                        }
                        if (tramController.value.text != "") {
                          tramHoursPerWeek =
                              double.parse(tramController.value.text);
                        }
                        if (bikeWalkController.value.text != "") {
                          bikeWalkHoursPerWeek =
                              double.parse(bikeWalkController.value.text);
                        }
                        if (motorbikeController.value.text != "") {
                          motorBikeHoursPerWeek =
                              double.parse(motorbikeController.value.text);
                        }
                        if (carController.value.text != "") {
                          carHoursPerWeek =
                              double.parse(carController.value.text);
                        }

                        calculate();
                        if (totalCarbonFootprint >= avg) {
                          status = "higher";
                        }

                        Map<String, dynamic> userData = {
                          'carbon_footprint': {
                            'household': householdFootprint,
                            'electricity': energyFootprint,
                            'transport': travelFootprint,
                            'total': totalCarbonFootprint,
                            'status': status,
                          }
                        };
                        storeUserData(userData);

                        // Proceed to the next screen
                        Get.to(ResultScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 45),
                      backgroundColor: ColorName.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(47),
                      ),
                    ),
                    child: Text('Show Results'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return 'Please enter a valid number';
    }
    if (doubleValue <= 0 || doubleValue > 1000) {
      return 'Value must be between 0 and 1000';
    }
    return null;
  }
}
