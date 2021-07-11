import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sado/model/user.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({Key? key, this.recommend = ''}) : super(key: key);

  final String recommend;
  @override
  Widget build(BuildContext context) {
    print(user.gender);
    return Scaffold(
      appBar: AppBar(
        title: Text("SADO"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/food-bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.2,
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20,
                            0,
                            10,
                          ),
                          child: Text(
                            'Result',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            'Conclusion',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          user.explanationFac(),
                          // 'You are 20 years old, male\nYour calorie goals was calculated using Mifflin St Jeor Equation\nYour calorie goral is 1186.25kcal per day\nBased on your BMI = 32.0, you are overweight',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                        // Divider(color: Colors.black),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            'Recommendation',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          recommend,
                          // '\nConsidering you need 1186.25kcal\nYou are recommended to eat these in Set A: \n\n Nasi lemak, Nasi Ayam bakar, Mee Hailam \n\n All foods in this set contains calories in the <1500 range',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            'Explanation',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          user.recommendedSet(),
                          // 'You are 20 years old, male\nYour calorie goals was calculated using Mifflin St Jeor Equation\nYour calorie goral is 1186.25kcal per day\nBased on your BMI = 32.0, you are overweight',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/',
                                    (route) => false,
                                  );
                                },
                                child: Text("Okay")),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
