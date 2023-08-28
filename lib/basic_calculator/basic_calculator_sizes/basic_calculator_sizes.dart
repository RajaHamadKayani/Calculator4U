import 'package:flutter/material.dart';

class BasicCalculaterResponsive extends StatefulWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget iSsmallMobile;
  const BasicCalculaterResponsive({
    super.key,
    this.tablet,
    required this.desktop,
    required this.iSsmallMobile,
    required this.mobile,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 850 &&
      MediaQuery.of(context).size.width >= 390 &&
      MediaQuery.of(context).size.height <= 1000;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width <= 1280 &&
      MediaQuery.of(context).size.height <= 2000;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280 &&
      MediaQuery.of(context).size.height >= 740 &&
      MediaQuery.of(context).size.height <= 970;
  static bool smallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 393 &&
      MediaQuery.of(context).size.width >= 160;
  static bool verysmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 160;

  @override
  State<BasicCalculaterResponsive> createState() =>
      _BasicCalculaterResponsiveState();
}

class _BasicCalculaterResponsiveState extends State<BasicCalculaterResponsive> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    if (size <= 850 && size >= 390) {
      return widget.mobile;
    } else if (size >= 850 && size <= 1280 && widget.tablet != null) {
      return widget.tablet!;
    } else if (size >= 1280) {
      return widget.desktop;
    } else {
      return widget.iSsmallMobile;
    }
  }
}

class CalculatorSizes {
  static double appBarIcon(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 22;
    } else {
      return 18;
    }
  }

  static double appBarTitle(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 22;
    } else {
      return 18;
    }
  }

  static double headingFontSizes(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 22;
    } else {
      return 18;
    }
  }

  static double textFormFieldAndOutputFontSizes(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 24;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 20;
    } else {
      return 16;
    }
  }

  static double calculationContainerHeight(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 400;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 350;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 300;
    } else {
      return 280;
    }
  }

  static double operatorsContainerHieght(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 80;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 75;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 60;
    } else {
      return 50;
    }
  }

  static double operatorsContainerWidth(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 200;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 150;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 100;
    } else if (BasicCalculaterResponsive.smallMobile(context)) {
      return 80;
    } else {
      return 40;
    }
  }

  static double operatorsTextFontSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 50;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 40;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 35;
    } else {
      return 25;
    }
  }

  static double drawerTextFontSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 18;
    } else {
      return 15;
    }
  }

  static double drawerIconSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 22;
    } else {
      return 18;
    }
  }

  static double hintTextFontSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 22;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 18;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 15;
    } else {
      return 10;
    }
  }
}
