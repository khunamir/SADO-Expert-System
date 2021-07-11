import 'dart:convert';

class User {
  double age;
  double weight;
  double height;
  String gender;
  String participate;
  String intensity;
  double bmi;
  double equation;
  User({
    this.age = 0.0,
    this.height = 0.0,
    this.weight = 0.0,
    this.gender = "",
    this.participate = "",
    this.intensity = "",
    this.bmi = 0.0,
    this.equation = 0.0,
  });

  User copyWith({
    double? age,
    double? weight,
    double? height,
    String? gender,
    String? participate,
    String? intensity,
    double? bmi,
    double? equation,
  }) {
    return User(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
      participate: participate ?? this.participate,
      intensity: intensity ?? this.intensity,
      bmi: bmi ?? this.bmi,
      equation: equation ?? this.equation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'weight': weight,
      'height': height,
      'gender': gender,
      'participate': participate,
      'intensity': intensity,
      'bmi': bmi,
      'equation': equation,
    };
  }

  Map<String, String> toMapString() {
    return {
      'age': age.toString(),
      'weight': weight.toString(),
      'height': height.toString(),
      'gender': gender,
      'participate': participate,
      'intensity': intensity,
      'bmi': bmi.toString(),
      'equation': equation.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      age: map['age'],
      weight: map['weight'],
      height: map['height'],
      gender: map['gender'],
      participate: map['participate'],
      intensity: map['intensity'],
      bmi: map['bmi'],
      equation: map['equation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(age: $age, weight: $weight, height: $height, gender: $gender, participate: $participate, intensity: $intensity, bmi: $bmi, equation: $equation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.age == age &&
        other.weight == weight &&
        other.height == height &&
        other.gender == gender &&
        other.participate == participate &&
        other.intensity == intensity &&
        other.bmi == bmi &&
        other.equation == equation;
  }

  @override
  int get hashCode {
    return age.hashCode ^
        weight.hashCode ^
        height.hashCode ^
        gender.hashCode ^
        participate.hashCode ^
        intensity.hashCode ^
        bmi.hashCode ^
        equation.hashCode;
  }

  setAssessment(double age, double weight, double height, String gender) {
    this.age = age;
    this.weight = weight;
    this.height = height;
    this.gender = gender.toLowerCase();
  }

  setCompetition(String participate, String intensity) {
    if (participate == "Yes") {
      this.participate = "y";
    } else {
      this.participate = "n";
    }
    this.intensity = intensity.toLowerCase();
  }

  calculateBMI() {
    double bmi = 0.0;
    double heightInM = height / 100;
    bmi = weight / (heightInM * heightInM);
    setBMI(bmi);
  }

  statusBMI() {
    if (bmi < 18.5) {
      return 'underweight';
    } else if (bmi >= 18.5 && bmi < 28.0) {
      return 'normal';
    } else {
      return 'overweight';
    }
  }

  recommendedSet() {
    String explanation = '';
    if (participate == 'y') {
      if (intensity == 'low') {
        if (statusBMI() == 'overweight' || statusBMI() == 'normal') {
          if (equation < 1300) {
            explanation =
                'Your intensity of training is low.\nThus, we recommend Low Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set D can supply right amount of calorie,\nunder 1300kcal, which suits your need. \n\nTo maintain the energy reservation for your compeitition.';
          } else if (equation >= 1300 && equation < 1700) {
            explanation =
                'Your intensity of training is low.\nThus, we recommend Low Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set E can supply right amount of calorie,\nbetween 1300kcal to 1700kcal, which suits your need. \n\nTo maintain the energy reservation for your compeitition.';
          } else if (equation >= 1700) {
            explanation =
                'Your intensity of training is low.\nThus, we recommend Low Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set F can supply right amount of calorie,\nabove 1700kcal, which suits your need. \n\nTo maintain the energy reservation for your compeitition.';
          }
        } else {
          if (equation < 1700) {
            explanation =
                'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set G can supply right amount of calorie, \nunder 1700kcal, which suits your need. \n\nThe recommendation can help you to maintain the energy reservation and gaining some weight.';
          } else if (equation >= 1700 && equation < 2100) {
            explanation =
                'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set H can supply right amount of calorie, \nbetween 1700kcal to 2100kcal, which suits your \nneed. \nThe recommendation can help you to maintain the energy reservation and gaining some weight.';
          } else if (equation >= 2100) {
            explanation =
                'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set H can supply right amount of calorie, \nabove 2100kcal, which suits your need. \n\nThe recommendation can help you to maintain the energy reservation and gaining some weight.';
          }
        }
      } else if (intensity == 'moderate') {
        if (equation < 1700) {
          explanation =
              'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set G can supply right amount of calorie, \nunder 1700kcal, which suits your need. \n\nThe recommendation can help you to maintain the energy reservation and gaining some weight.';
        } else if (equation >= 1700 && equation < 2100) {
          explanation =
              'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set H can supply right amount of calorie, \nbetween 1700kcal to 2100kcal, which suits your \nneed. \nThe recommendation can help you to maintain the energy reservation and gaining some weight.';
        } else if (equation >= 2100) {
          explanation =
              'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set H can supply right amount of calorie, \nabove 2100kcal, which suits your need. \n\nThe recommendation can help you to maintain the energy reservation and gaining some weight.';
        }
      } else if (intensity == 'high') {
        if (statusBMI() == 'underweight' || statusBMI() == 'normal') {
          if (equation < 2100) {
            explanation =
                'Your intensity of training is high.\nThus, we recommend High Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set J can supply right amount of calorie, \nunder 2100kcal, which suits your need. \n\nTo maintain the energy reservation for your compeitition.';
          } else if (equation >= 2100 && equation < 2500) {
            explanation =
                'Your intensity of training is high.\nThus, we recommend High Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set K can supply right amount of calorie, \nbetween 2100kcal to 2500kcal, which suits your \nneed. \nTo maintain the energy reservation for your compeitition.';
          } else if (equation >= 2500) {
            explanation =
                'Your intensity of training is high.\nThus, we recommend High Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set L can supply right amount of calorie, \nabove 2500kcal, which suits your need. \n\nTo maintain the energy reservation for your compeitition.';
          }
        } else {
          if (equation < 1700) {
            explanation =
                'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set G can supply right amount of calorie, \nunder 1700kcal, which suits your need. \n\nThe recommendation can help you to maintain the energy reservation and losing some weight.';
          } else if (equation >= 1700 && equation < 2100) {
            explanation =
                'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set H can supply right amount of calorie, \nbetween 1700kcal to 2100kcal, which suits your \nneed. \nThe recommendation can help you to maintain the energy reservation and losing some weight.';
          } else if (equation >= 2100) {
            explanation =
                'Your intensity of training is moderate.\nThus, we recommend Moderate Intensive Meal Planning for your diet stratergy. \n\nWith the given calorie goal and BMI. \nThe food in Set H can supply right amount of calorie, \nabove 2100kcal, which suits your need. \n\nThe recommendation can help you to maintain the energy reservation and losing some weight.';
          }
        }
      }
    } else {
      // Casual Meal Planning
      if (equation < 1500) {
        explanation =
            'We recommend Casual Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set A can supply right amount of calorie, \nunder 1500kcal, which suits your need. \n\nTo maintain the energy reservation.';
      } else if (equation >= 1500 && equation < 2500) {
        explanation =
            'We recommend Casual Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set B can supply right amount of calorie, \nbetween 1500kcal to 2500kcal, which suits your \nneed. \nTo maintain the energy reservation.';
      } else if (equation >= 2500) {
        explanation =
            'We recommend Casual Meal Planning for your diet stratergy. \n\nWith the given calorie goal. \nThe food in Set C can supply right amount of calorie, \nabove 2500kcal, which suits your need. \n\nTo maintain the energy reservation.';
      }
    }
    return explanation;
  }

  calculateEquation() {
    double calorieGoals = 0.0;
    if (gender == "Male" || gender == "male") {
      calorieGoals = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      calorieGoals = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    setEquation(calorieGoals);
  }

  explanationFac() {
    String str = "\nYou are a " +
        age.toString() +
        ' years old, ' +
        gender +
        ". \nYour calorie goals was calculated using Mifflin St Jeor Equation." +
        "\nYour calorie goals is " +
        equation.toString() +
        "kcal per day\n";
    if (bmi < 18.5) {
      str = str +
          "Based on your BMI = " +
          bmi.toStringAsFixed(1) +
          ", you are underweight. ";
    } else if (bmi >= 18.5 && bmi < 28.0) {
      str = str +
          "Based on your BMI = " +
          bmi.toStringAsFixed(1) +
          " you are normal. ";
    } else {
      str = str +
          "Based on your BMI = " +
          bmi.toStringAsFixed(1) +
          " you are overweight. ";
    }
    str = str + "\n";
    return str;
  }

  void setBMI(double bmi) {
    this.bmi = bmi;
  }

  void setEquation(double calorieGoals) {
    this.equation = calorieGoals;
  }
}

User user = User();
