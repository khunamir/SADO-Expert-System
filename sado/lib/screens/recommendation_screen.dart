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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  user.explanationFac(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  recommend,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
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
    );
  }
}
