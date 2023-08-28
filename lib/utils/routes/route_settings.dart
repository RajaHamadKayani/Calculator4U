import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/age_calculator/age_calculator.dart';
import 'package:gpa_calculator_4u/aggregate_calculator/aggregate_calculator.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator.dart';
import 'package:gpa_calculator_4u/cummulative_gpa/cummulative_gpa.dart';
import 'package:gpa_calculator_4u/health_calculator/health_calculator.dart';
import 'package:gpa_calculator_4u/gpa_calculator/gpa_calculator.dart';
import 'package:gpa_calculator_4u/home_screen/home_screen.dart';
import 'package:gpa_calculator_4u/splash_screen/splash_screen.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';

class AppRouteSetting {
  static Route<dynamic> routeSettings(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.name;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.basicCal:
        return MaterialPageRoute(builder: (_) => BasicCalculator());
      case RouteName.aggregateCal:
        return MaterialPageRoute(builder: (_) => const AggregateCalculator());
      case RouteName.gpaCal:
        return MaterialPageRoute(builder: (_) => const GPACalculator());
      case RouteName.cgpaCal:
        return MaterialPageRoute(builder: (_) => const CummulativeGpa());
      case RouteName.ageCal:
        return MaterialPageRoute(builder: (_) => const AgeCalculator());
      case RouteName.healthCal:
        return MaterialPageRoute(builder: (_) => const HealthCalculator());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route found for ${settings.name}"),
                  ),
                ));
    }
  }
}
