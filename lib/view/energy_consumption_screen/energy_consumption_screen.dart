import 'package:flutter/material.dart';
import 'package:footprint/controllers/calculations.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/services/auth_service.dart';
import 'package:footprint/view/app_widgets/custom_background.dart';
import 'package:footprint/view/result_screen/result_screen.dart';
import 'package:footprint/view/transport_screen/transport_screen.dart';
import 'package:get/get.dart';

class EnergyScreen extends StatefulWidget {
  const EnergyScreen({super.key});

  @override
  State<EnergyScreen> createState() => _EnergyScreenState();
}

class _EnergyScreenState extends State<EnergyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController electricityController = TextEditingController();

  String dropDownValue = "Coal";

  double electricityConsumptionKWhPerWeek = 0.0; // Added to store the electricity consumption


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
                    Icons.flash_on_outlined,
                    size: 30,
                    color: ColorName.buttonColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ENERGY CONSUMPTION',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(
                color: ColorName.buttonColor,
                thickness: 1,
              ),
              SizedBox(
                height: 135,
              ),
              Text(
                'Electricity consumption?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: electricityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  final doubleValue = double.tryParse(value);
                  if (doubleValue == null) {
                    return 'Please enter a valid number';
                  }
                  if (doubleValue < 1 || doubleValue > 1000) {
                    return 'Value must be between 1 and 1000';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter a value from 1 to 1000',
                  suffixText: "KWh/week",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.buttonColor),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Text(
                'Heating energy source?',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                padding: EdgeInsets.only(left: 190),
                value: dropDownValue,
                items: <String>[
                  'Coal',
                  'Charcoal',
                  'Electricity',
                  'Heating Oil',
                  'Natural Gas',
                  'No Heating',
                  'Peat',
                  'Vegetable Oil',
                  'Wood',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 215,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        electricityConsumptionKWhPerWeek = double.parse(electricityController.text);
                        heatingSource = dropDownValue;

                        Get.to(TransportScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 45),
                      backgroundColor: ColorName.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(47),
                      ),
                    ),
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
