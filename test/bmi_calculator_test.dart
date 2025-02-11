import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BMI class tests for males', () {
    test('Compute BMI', () {
      final bmiCalculator = BMI(
        standard: Standard.ASIAN,
        height: 1.75,
        weight: 70,
        ageInDays: 9125,
        gender: "male",
      );

      expect(bmiCalculator.computeBMI(), closeTo(22.86, 0.01));
    });

    test('Interpret BMI for age not within 5-19', () {
      final bmiCalculator = BMI(
        standard: Standard.WHO,
        height: 1.75,
        weight: 70,
        ageInDays: 9125,
        gender: "male",
      );

      expect(bmiCalculator.interpretBMI(), "Normal");
    });

    test('Interpret BMI for age within 5-19', () {
      final bmiCalculator = BMI(
        standard: Standard.ASIAN,
        height: 1.2,
        weight: 20,
        ageInDays: 2340,
        gender: "male",
      );
      expect(bmiCalculator.interpretBMI(), "Normal weight");
    });
  });

  group('BMI class tests for females', () {
    test('Compute BMI for female', () {
      final bmiCalculator = BMI(
        standard: Standard.ASIAN,
        height: 1.6,
        weight: 55,
        ageInDays: 10225,
        gender: "female",
      );

      expect(bmiCalculator.computeBMI(), closeTo(21.48, 0.01));
    });

    test('Interpret BMI for female age not within 5-19', () {
      final bmiCalculator = BMI(
        standard: Standard.WHO,
        height: 1.6,
        weight: 55,
        ageInDays: 10225,
        gender: "female",
      );

      expect(bmiCalculator.interpretBMI(), "Normal");
    });

    test('Interpret BMI for female age within 5-19 (Normal Weight)', () {
      final bmiCalculator = BMI(
        standard: Standard.ASIAN,
        height: 1.4,
        weight: 30,
        ageInDays: 3830,
        gender: "female",
      );
      expect(bmiCalculator.interpretBMI(), "Normal weight");
    });

    test('Interpret BMI for female age within 5-19 (Wasted)', () {
      final bmiCalculator = BMI(
        standard: Standard.ASIAN,
        height: 1.4,
        weight: 25,
        ageInDays: 3830,
        gender: "female",
      );
      expect(bmiCalculator.interpretBMI(), "Wasted");
    });

    test('Interpret BMI for female age within 5-19 (Overweight)', () {
      final bmiCalculator = BMI(
        standard: Standard.ASIAN,
        height: 1.4,
        weight: 40,
        ageInDays: 3830,
        gender: "female",
      );
      expect(bmiCalculator.interpretBMI(), "Overweight");
    });
  });
}
