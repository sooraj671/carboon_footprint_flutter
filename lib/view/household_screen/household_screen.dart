import 'package:flutter/material.dart';
import 'package:footprint/controllers/calculations.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/view/app_widgets/custom_background.dart';
import 'package:footprint/view/energy_consumption_screen/energy_consumption_screen.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../services/auth_service.dart';

class HouseholdScreen extends StatefulWidget {
  const HouseholdScreen({super.key});

  @override
  State<HouseholdScreen> createState() => _HouseholdScreenState();
}

class _HouseholdScreenState extends State<HouseholdScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropDownValue = "Flat";

  TextEditingController peopleController = TextEditingController();
  TextEditingController housingSizeController = TextEditingController();

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
                    Icons.home,
                    size: 30,
                    color: ColorName.buttonColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ABOUT YOUR HOUSEHOLD',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(
                color: ColorName.buttonColor,
                thickness: 1,
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Number of people in household?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: peopleController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  final intValue = int.tryParse(value);
                  if (intValue == null) {
                    return 'Please enter a valid number';
                  }
                  if (intValue < 1 || intValue > 100) {
                    return 'Value must be between 1 and 100';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter a number between 1 and 100',

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Replace with your color
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Size of Housing(m2)?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: housingSizeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  final intValue = int.tryParse(value);
                  if (intValue == null) {
                    return 'Please enter a valid number';
                  }
                  if (intValue < 25 || intValue > 1000) {
                    return 'Value must be between 25 and 1000';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter a number between 25 and 1000',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Replace with your color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Replace with your color
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Type of Housing?',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    // Step 3.
                    value: dropDownValue,
                    // Step 4.
                    items: <String>[
                      'Flat',
                      'Detached',
                      'Semi Detached',
                      'Attached Home'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 170,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // All fields are valid, proceed to the next screen
                        numberOfPeople = int.parse(peopleController.value.text);;
                        housingSizeInSquareMeters = double.parse(housingSizeController.value.text);
                        housingType = dropDownValue;
                        Get.to(EnergyScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(120, 45),
                        backgroundColor: ColorName.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(47))),
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
