import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/aggregate_calculator/sizes/sizes.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({super.key});

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  void dispose() {
    _birthDateController.dispose();
    _birthMonthController.dispose();
    _birthYearController.dispose();
    super.dispose();
  }

  final TextEditingController _birthYearController = TextEditingController();
  final TextEditingController _birthMonthController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String ageResult = '';
  void calculateAge() {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int currentDate = DateTime.now().day;
    int birthYear = int.parse(_birthYearController.text);
    int birthDate = int.parse(_birthDateController.text);
    int birthMonth = int.parse(_birthMonthController.text);
    int calculatedYears = currentYear - birthYear;
    int caculatedMonths = currentMonth - birthMonth;
    int calculatedDate = currentDate - birthDate;
    if (caculatedMonths < 0 || (caculatedMonths == 0 && calculatedDate < 0)) {
      calculatedYears--;
      caculatedMonths = caculatedMonths + 12;
    }
    ageResult =
        "Age: $calculatedYears years, $caculatedMonths month, $calculatedDate days";
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
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
          "Age Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: CalculatorSizes.appBarTitle(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableComponent(
                  controller: _birthDateController,
                  hintText: "Enter Date",
                  titleText: "Enter your BirthDate:"),
              ReusableComponent(
                  controller: _birthMonthController,
                  hintText: "Enter Month",
                  titleText: "Enter your BirthMonth:"),
              ReusableComponent(
                  controller: _birthYearController,
                  hintText: "Enter Year",
                  titleText: "Enter your BirthYear:"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    calculateAge();
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Your Calculated Age is: ",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff))),
              ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text("$ageResult",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableComponent extends StatefulWidget {
  String titleText;
  TextEditingController controller;
  String hintText;
  ReusableComponent(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.titleText});

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
                  keyboardType: TextInputType.number,
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
