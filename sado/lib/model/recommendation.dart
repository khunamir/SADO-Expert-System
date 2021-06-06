import 'dart:convert';

class Recommendation {
  String title;
  String foods;
  String recommendation;
  Recommendation({
    this.title = '',
    this.foods = '',
    this.recommendation = '',
  });

  Recommendation copyWith({
    String? title,
    String? foods,
    String? recommendation,
  }) {
    return Recommendation(
      title: title ?? this.title,
      foods: foods ?? this.foods,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'foods': foods,
      'recommendation': recommendation,
    };
  }

  factory Recommendation.fromMap(Map<String, dynamic> map) {
    return Recommendation(
      title: map['title'],
      foods: map['foods'],
      recommendation: map['recommendation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Recommendation.fromJson(String source) =>
      Recommendation.fromMap(json.decode(source));

  @override
  String toString() =>
      'Recommendation(title: $title, foods: $foods, recommendation: $recommendation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recommendation &&
        other.title == title &&
        other.foods == foods &&
        other.recommendation == recommendation;
  }

  @override
  int get hashCode => title.hashCode ^ foods.hashCode ^ recommendation.hashCode;

  void setRecommendation(String title, String foods, String recommend) {
    this.title = title;
    this.foods = foods;
    this.recommendation = recommend;
  }

  String getRecommendation() {
    return title + "\n\n" + foods + "\n\n" + recommendation;
  }

  isDataExist() {
    if (title == "") {
      return false;
    }
    return true;
  }
}
Recommendation recommendation = Recommendation();
