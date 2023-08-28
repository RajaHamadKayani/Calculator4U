import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/aggregate_calculator/sizes/sizes.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';
import 'package:lottie/lottie.dart';

enum Gender { Male, Female }

enum ActivityLevel { sedentary, lightlyActive, moderatelyActive, veryActive }

enum Climate { normal, humid, hot }

class UserInput {
  Gender gender;
  ActivityLevel activityLevel;
  Climate climate;
  double height;
  double weight;
  int age;
  UserInput(
      {required this.activityLevel,
      required this.age,
      required this.climate,
      required this.gender,
      required this.height,
      required this.weight});
}

class HealthCalculations {
  static const double feetToCmMultiplier = 30.48;
  static const double waterPerCalorie = 0.03;
  double calcualteBmr(UserInput userInput) {
    double bmr = 0.0;
    if (userInput.gender == Gender.Male) {
      bmr = 66.5 +
          (13.75 * userInput.weight) +
          (5.003 * (userInput.height * feetToCmMultiplier)) -
          (6.755 * userInput.age);
    } else {
      bmr = 655.1 +
          (9.563 * userInput.weight) +
          (1.850 * (userInput.height * feetToCmMultiplier)) -
          (4.676 * userInput.age);
    }
    return bmr;
  }

  double getActivityMultiplier(ActivityLevel activityLevel) {
    switch (activityLevel) {
      case ActivityLevel.sedentary:
        return 1.2;
      case ActivityLevel.lightlyActive:
        return 1.375;
      case ActivityLevel.moderatelyActive:
        return 1.55;
      case ActivityLevel.veryActive:
        return 1.725;
    }
  }

  double getClimateMultiplier(Climate climate) {
    switch (climate) {
      case Climate.normal:
        return 1.0;
      case Climate.humid:
        return 0.9;
      case Climate.hot:
        return 0.85;
    }
  }

  double getDailyCalorieIntake(UserInput userInput) {
    double bmr = calcualteBmr(userInput);
    double actitvityMultilier = getActivityMultiplier(userInput.activityLevel);
    double climateMultiplier = getClimateMultiplier(userInput.climate);
    double getCalorieIntake = bmr * actitvityMultilier * climateMultiplier;
    return getCalorieIntake;
  }

  double getWterInter(double weightKg) {
    return 35.0 * weightKg;
  }
}

class HealthCalculator extends StatefulWidget {
  const HealthCalculator({super.key});

  @override
  State<HealthCalculator> createState() => _HealthCalculatorState();
}

class _HealthCalculatorState extends State<HealthCalculator>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  Gender _selectedGender = Gender.Male;
  ActivityLevel _selectedActivityLevel = ActivityLevel.sedentary;
  Climate _selectedClimate = Climate.normal;

  double _calories = 0;
  double _waterIntake = 0;

  final _formKey = GlobalKey<FormState>();

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      double heightFeet = double.tryParse(_heightController.text) ?? 0;
      int age = int.tryParse(_ageController.text) ?? 0;
      double weight = double.tryParse(_weightController.text) ?? 0;

      UserInput input = UserInput(
        height: heightFeet,
        age: age,
        weight: weight,
        gender: _selectedGender,
        activityLevel: _selectedActivityLevel,
        climate: _selectedClimate,
      );

      HealthCalculations calculator = HealthCalculations();

      setState(() {
        _calories = calculator.getDailyCalorieIntake(input);
        _waterIntake = calculator.getWterInter(_calories);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.homeScreen);
          },
          icon: Icon(
            Icons.arrow_back,
            size: CalculatorSizes.appBarIcon(context),
          ),
          color: Colors.black,
        ),
        title: Text(
          "Health Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: CalculatorSizes.appBarTitle(context)),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff000000),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Lottie.asset("assets/json/health_calculator.json",
                      onLoaded: (composition) {
                    animationController.duration = composition.duration;
                    animationController.repeat();
                  }),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                    vertical: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ReusableComponent(
                              controller: _ageController,
                              textInputType: TextInputType.number,
                              hintText: "Enter age",
                              titleText: "Enter Your Age"),
                        ],
                      ),
                    ),
                    ReusableComponent(
                        controller: _heightController,
                        textInputType: TextInputType.number,
                        hintText: "Enter height",
                        titleText: "Enter Your Height"),
                    ReusableComponent(
                        controller: _weightController,
                        textInputType: TextInputType.number,
                        hintText: "Enter weight",
                        titleText: "Enter Your Weight"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Enter your gender:",
                      style: TextStyle(
                          fontSize: Sizes.titleTextFontSize(context),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Radio<Gender>(
                            value: Gender.Male,
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            }),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        Radio<Gender>(
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                          value: Gender.Female,
                          groupValue: _selectedGender,
                        ),
                        const Text(
                          "Female",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: DropdownButtonFormField<ActivityLevel>(
                          value: _selectedActivityLevel,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedActivityLevel = newValue!;
                            });
                          },
                          items: ActivityLevel.values
                              .map<DropdownMenuItem<ActivityLevel>>(
                                (activityLevel) => DropdownMenuItem(
                                  value: activityLevel,
                                  child: Text(
                                    activityLevel.toString().split('.').last,
                                  ),
                                ),
                              )
                              .toList(),
                          decoration: const InputDecoration(
                              labelText: 'Activity Level',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: DropdownButtonFormField<Climate>(
                        value: _selectedClimate,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedClimate = newValue!;
                          });
                        },
                        items: Climate.values
                            .map<DropdownMenuItem<Climate>>(
                              (climate) => DropdownMenuItem(
                                value: climate,
                                child: Text(climate.toString().split('.').last),
                              ),
                            )
                            .toList(),
                        decoration: InputDecoration(
                            labelText: 'Climate',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff))),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Calculate'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _calories > 0 && _waterIntake > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Recommended Daily calories intake: $_calories",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                "Recommended Daily Water intake: $_waterIntake",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              )
                            ],
                          )
                        : SizedBox.shrink()
                  ],
                )),
          ]))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableComponent extends StatefulWidget {
  String titleText;
  TextInputType textInputType;
  TextEditingController controller;
  String hintText;
  ReusableComponent(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.titleText,
      required this.textInputType});

  @override
  State<ReusableComponent> createState() => _ReusableComponentState();
}

class _ReusableComponentState extends State<ReusableComponent> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.titleTextFontSize(context),
              color: const Color(0xffffffff)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Focus(
          focusNode: focusNode,
          onFocusChange: (hasFocus) {
            setState(() {});
          },
          child: Center(
            child: Container(
              height: 40,
              width: BasicCalculaterResponsive.isDesktop(context)
                  ? 400
                  : BasicCalculaterResponsive.isTablet(context)
                      ? 350
                      : BasicCalculaterResponsive.isMobile(context)
                          ? 250
                          : BasicCalculaterResponsive.smallMobile(context)
                              ? 150
                              : 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: focusNode.hasFocus ? Colors.green : Colors.white,
                      width: focusNode.hasFocus ? 2 : 1)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01),
                child: TextFormField(
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your age';
                  //   }
                  //   return null;
                  // },
                  keyboardType: widget.textInputType,
                  style: TextStyle(
                      fontSize: BasicCalculaterResponsive.isDesktop(context)
                          ? 32
                          : BasicCalculaterResponsive.isTablet(context)
                              ? 26
                              : BasicCalculaterResponsive.isMobile(context)
                                  ? 24
                                  : BasicCalculaterResponsive.smallMobile(
                                          context)
                                      ? 20
                                      : 16,
                      color: const Color(
                        0xffffffff,
                      ),
                      fontWeight: FontWeight.bold),
                  controller: widget.controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: Sizes.hintTextFontSize(context),
                      )),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        )
      ],
    );
  }
}
