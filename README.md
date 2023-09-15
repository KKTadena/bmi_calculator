# BMI Calculator Package Documentation

## Introduction

This package, `BMI`, provides a way to compute the Body Mass Index (BMI) and interpret the results based on age, gender, weight, and height. The interpretations are based on guidelines from the World Health Organization (WHO).



### Properties:

- **height**: Height of the individual in meters.
- **weight**: Weight of the individual in kilograms.
- **ageYears**: Age of the individual in years.
- **ageMonths**: Additional age of the individual in months.
- **gender**: Gender of the individual. Accepts values "male" or "female".

### Methods:

1. **computeBMI()**
   - Computes the Body Mass Index (BMI) using the formula:
     BMI = kg/m2
   - Returns the computed BMI value as a double.

2. **interpretBMI()**
   - Interprets the BMI value:
     - For individuals outside the age range of 5-19 years, it uses the general BMI categories.
     - For children and teenagers aged 5-19, it uses BMI-for-age percentiles data, considering the gender of the individual.
   - Returns a string interpretation of the BMI.

## Interpretation Guidelines:

1. **For Adults (outside the age range of 5-19 years)**:
   - Severely underweight: BMI < 16
   - Underweight: 16 ≤ BMI < 16.9
   - Mildly underweight: 16.9 ≤ BMI < 18.4
   - Normal weight: 18.4 ≤ BMI < 24.9
   - Overweight: 24.9 ≤ BMI < 29.9
   - Obese Class I (Moderate): 29.9 ≤ BMI < 34.9
   - Obese Class II (Severe): 34.9 ≤ BMI < 39.9
   - Obese Class III (Very severe or morbidly obese): BMI ≥ 40

2. **For Children and Teenagers (age range of 5-19 years)**:
   - Severely wasted: BMI less than the -3rd percentile
   - Wasted: BMI between the -3rd and -2nd percentiles
   - Normal weight: BMI between the -2nd and 0th percentiles
   - Possible risk of overweight: BMI between the 0th and 1st percentiles
   - Overweight: BMI between the 1st and 2nd percentiles
   - Obese: BMI greater than the 2nd percentile

**Note**: For the age-specific interpretations, the percentile data from WHO is used. It's essential to ensure the correctness of this dataset for accurate interpretations.
