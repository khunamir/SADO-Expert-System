import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:sado/screens/assessment_screen.dart';
import 'package:sado/screens/compeitition_screen.dart';
import 'package:sado/screens/home_screen.dart';
import 'package:sado/screens/recommendation_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.autoScaleDown(380, name: 'IPHONE5'),
          ResponsiveBreakpoint.resize(410, name: MOBILE),
          ResponsiveBreakpoint.autoScale(700, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: '4K'),
        ],
        background: Container(
          color: Color(0xFFF5F5F5),
        ),
      ),
      title: 'SADO Expert System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/assessment': (context) => AssessmentScreen(),
        '/compeitition': (context) => CompeititionScreen(),
        '/recommendation': (context) => RecommendationScreen(),
        // '/': (context) => RecommendationScreen(),
      },
    );
  }
}
