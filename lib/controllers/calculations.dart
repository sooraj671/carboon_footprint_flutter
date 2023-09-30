// User inputs (you need to collect these from the user)
import 'dart:developer';

int numberOfPeople = 4;
double housingSizeInSquareMeters = 150.0;
double electricityConsumptionKWhPerWeek = 50.0; // Replace with user's input

double intercityTrainHoursPerWeek = 0.0; // Hours per week spent on Intercity Train
double subwayHoursPerWeek = 0.0; // Hours per week spent on Subway
double intercityBusHoursPerWeek = 0.0; // Hours per week spent on Intercity Bus
double cityBusHoursPerWeek = 0.0; // Hours per week spent on City Bus
double tramHoursPerWeek = 0.0; // Hours per week spent on Tram
double bikeWalkHoursPerWeek = 0.0; // Hours per week spent on Bike/walk
double motorBikeHoursPerWeek = 0.0; // Hours per week spent on MotorBike
double carHoursPerWeek = 0.0; // Hours per week spent on Car


// Define emission factors (as per the discussion)
double carbonFactorPerPerson = 0.3;
double carbonFactorPerSquareMeter = 0.2;
double electricityEmissionFactor = 0.6; // CO2 emissions per KWh (in Pakistan)

String housingType = 'Detached'; // Replace with user's choice

String heatingSource = 'Natural Gas'; // Replace with user's choice


Map<String, double> housingTypeFactors = {
  'Flat': 2.0,
  'Detached': 0.5,
  'Semi Detached': 1.5,
  'Attached Home': 2.5,
};

Map<String, double> heatingSourceFactors = {
  'Coal': 1.2,
  'Charcoal': 1.1,
  'Electricity': 0.5,
  'Heating Oil': 1.5,
  'Natural Gas': 1.7,
  'No Heating': 0.0,
  'Peat': 2.0,
  'Vegetable Oil': 1.9,
  'Wood': 1.3,
};

Map<String, double> transportationFactors = {
  'Intercity Train': 0.03,
  'Subway': 0.02,
  'Intercity Bus': 0.04,
  'City Bus': 0.05,
  'Tram': 0.04,
  'Bike/walk': 0.0,
  'MotorBike': 0.1,
  'Car': 0.2,
};

double householdFootprint = 0;
double travelFootprint = 0;
double energyFootprint = 0;
double totalCarbonFootprint = 0;

void calculate(){
  // Calculate carbon footprint for each category
  householdFootprint = (numberOfPeople * carbonFactorPerPerson) +
      (housingSizeInSquareMeters * carbonFactorPerSquareMeter) +
      (housingTypeFactors[housingType] ?? 0.0) +
      (heatingSourceFactors[heatingSource] ?? 0.0);
  log("printing inside calculation: $householdFootprint");

  travelFootprint = (intercityTrainHoursPerWeek * transportationFactors['Intercity Train']!) +
      (subwayHoursPerWeek * transportationFactors['Subway']!) +
      (intercityBusHoursPerWeek * transportationFactors['Intercity Bus']!) +
      (cityBusHoursPerWeek * transportationFactors['City Bus']!) +
      (tramHoursPerWeek * transportationFactors['Tram']!) +
      (bikeWalkHoursPerWeek * transportationFactors['Bike/walk']!) +
      (motorBikeHoursPerWeek * transportationFactors['MotorBike']!) +
      (carHoursPerWeek * transportationFactors['Car']!);



  energyFootprint = (electricityConsumptionKWhPerWeek * electricityEmissionFactor) +
      (heatingSourceFactors[heatingSource] ?? 0.0);

  // Calculate total weekly carbon footprint
  totalCarbonFootprint = householdFootprint + travelFootprint + energyFootprint;

}