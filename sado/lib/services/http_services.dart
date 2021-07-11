import 'package:dio/dio.dart';
import 'package:sado/model/recommendation.dart';
import 'package:sado/model/user.dart';

class HttpServices {
  // String url = "https://sado-es.herokuapp.com/"; // Flask local development
  String url = "http://127.0.0.1:5000/";
  callEngine() async {
    try {
      var response =
          await Dio().post(url + '/runEngine', data: user.toMapString());
      recommendation.setRecommendation(response.data["title"],
          response.data["foods"], response.data["recommendation"]);
      print(recommendation.getRecommendation());
      return recommendation.getRecommendation();
    } catch (e) {
      print(e);
    }
  }
}

HttpServices httpServices = HttpServices();
