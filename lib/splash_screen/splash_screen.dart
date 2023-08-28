import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Future navigateToHomeScreen() async {
    Timer(const Duration(seconds: 4), () async {
      Navigator.pushNamed(context, RouteName.homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/json/calculator_splash.json",
                onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.repeat();
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Welcome To ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 22)),
              TextSpan(
                  text: "Calculator ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 25,
                      fontStyle: FontStyle.italic)),
              TextSpan(
                  text: "4U",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 22))
            ]))
          ],
        ),
      ),
    );
  }
}
