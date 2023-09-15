import 'package:bmi_calculator/data/boys_data.dart';
import 'package:bmi_calculator/data/girls_data.dart';

enum Standard { WHO, ASIAN }

class BMI {
  double height; //  meters
  double weight; //  kilograms
  int ageYears;
  int ageMonths;
  String gender;
  Standard standard;

  BMI({
    required this.height,
    required this.weight,
    required this.ageYears,
    required this.ageMonths,
    required this.gender,
    required this.standard,
  });

  double computeBMI() {
    return weight / (height * height);
  }

  String interpretBMI() {
    double bmi = computeBMI();

    if (ageYears < 5 || ageYears > 19) {
      // Compute BMI normally
      if(standard == Standard.WHO) {
        if (bmi < 18.5) {
          return "Underweight";
        } else if (bmi < 25) {
          return "Normal";
        } else if (bmi < 30) {
          return "Overweight";
        } else {
          return "Obese";
        }
      }
      else {
        if (bmi < 18.5) {
          return "Underweight";
        } else if (bmi < 23) {
          return "Normal";
        } else if (bmi < 25) {
          return "Overweight";
        } else {
          return "Obese";
        }
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
