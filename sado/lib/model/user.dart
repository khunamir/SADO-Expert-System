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
    String str = "\nSince your gender is " +
        gender +
        " and your age is " +
        age.toString() +
        ". \nWe calculated your calorie goals using Mifflin St Jeor Equation." +
        "\nAnd your calorie goals is " +
        equation.toString() +
        "kcal\n";
    if (bmi < 18.5) {
      str = str +
          "Based on your BMI, " +
          bmi.toStringAsFixed(1) +
          " it is underweight. ";
    } else if (bmi >= 18.5 && bmi < 28.0) {
      str = str +
          "Based on your BMI, " +
          bmi.toStringAsFixed(1) +
          " it is normal. ";
    } else {
      str = str +
          "Based on your BMI, " +
          bmi.toStringAsFixed(1) +
          " it is overweight. ";
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
