import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';

class Sizes {
  static double titleTextFontSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 22;
    } else {
      return 19;
    }
  }

  static double rowTextFontSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 24;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 20;
    } else {
      return 18;
    }
  }

  static double textFormFieldHeight(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 50;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 50;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 40;
    } else {
      return 40;
    }
  }

  static double textFormFieldWidth(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 350;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 300;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 200;
    } else {
      return 160;
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
      return 14;
    }
  }

  static double calculateContainerHeight(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 50;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 50;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 40;
    } else {
      return 40;
    }
  }

  static double calculateContainerWidth(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 500;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 400;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 300;
    } else {
      return 180;
    }
  }

  static double calculateTextFontSize(BuildContext context) {
    if (BasicCalculaterResponsive.isDesktop(context)) {
      return 32;
    } else if (BasicCalculaterResponsive.isTablet(context)) {
      return 28;
    } else if (BasicCalculaterResponsive.isMobile(context)) {
      return 26;
    } else {
      return 20;
    }
  }
}
