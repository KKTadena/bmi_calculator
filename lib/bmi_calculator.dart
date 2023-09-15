import 'package:bmi_calculator/data/boys_data.dart';
import 'package:bmi_calculator/data/girls_data.dart';

class BMI {
  double height; //  meters
  double weight; //  kilograms
  int ageYears;
  int ageMonths;
  String gender;

  BMI({
    required this.height,
    required this.weight,
    required this.ageYears,
    required this.ageMonths,
    required this.gender,
  });

  double computeBMI() {
    return weight / (height * height);
  }

  String interpretBMI() {
    double bmi = computeBMI();

    if (ageYears < 5 || ageYears > 19) {
      // Compute BMI normally
      if (bmi < 16) {
        return "Severely underweight";
      } else if (bmi < 16.9) {
        return "Underweight";
      } else if (bmi < 18.4) {
        return "Mildly underweight";
      } else if (bmi < 24.9) {
        return "Normal weight";
      } else if (bmi < 29.9) {
        return "Overweight";
      } else if (bmi < 34.9) {
        return "Obese Class I (Moderate)";
      } else if (bmi < 39.9) {
        return "Obese Class II (Severe)";
      } else {
        return "Obese Class III (Very severe or morbidly obese)";
      }
    } else {
      // Use the gender-specific data
      Map<String, Map<String, double>> data =
          (gender == "male") ? boysBMI : girlsBMI;
      String ageKey = "$ageYears-$ageMonths";
      Map<String, double> ageData = data[ageKey] ?? {};

      // Find the appropriate percentile based on the data
      if (bmi < ageData['-3']!) {
        return "Severely wasted";
      } else if (bmi < ageData['-2']!) {
        return "Wasted";
      } else if (bmi < ageData['-1']!) {
        return "Normal weight";
      } else if (bmi < ageData['0']!) {
        return "Normal weight";
      } else if (bmi < ageData['1']!) {
        return "Possible risk of overweight";
      } else if (bmi < ageData['2']!) {
        return "Overweight";
      } else {
        return "Obese";
      }
    }
  }
}
