import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_component/basic_calculator_component.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';

enum SelectedOperation {
  none,
  addition,
  subtraction,
  multiplication,
  division,
  percentage
}

class BasicCalculator extends StatefulWidget {
  BasicCalculator({Key? key}) : super(key: key);

  @override
  State<BasicCalculator> createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  CalculatePercentage calculatePercentage = CalculatePercentage();
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secndNumberController = TextEditingController();
  String sum = '';
  String sub = '';
  String mul = '';
  String div = '';
  String percentage = "";

  SelectedOperation selectedOperation = SelectedOperation.none;
  void resetCalculator() {
    setState(() {
      firstNumberController.clear();
      secndNumberController.clear();
      selectedOperation = SelectedOperation.none;
    });
  }

  performOperation(String first, String second) {
    double num1 = double.parse(first);
    double num2 = double.parse(second);
    double result = 0;
    switch (selectedOperation) {
      case SelectedOperation.addition:
        result = num1 + num2;
        sum = result.toString();
        break;
      case SelectedOperation.subtraction:
        result = num1 - num2;
        sub = result.toString();
        break;
      case SelectedOperation.multiplication:
        result = num1 * num2;
        mul = result.toString();
        break;
      case SelectedOperation.division:
        if (num2 != 0) {
          result = num1 / num2;
          div = result.toString();
        } else {
          div = "Cannot divide by zero";
        }
        break;
      case SelectedOperation.percentage:
        result = (num2 / num1) * 100;
        percentage = result.toString();
        break;
      default:
        break;
    }
    setState(() {});
  }

  void dispose() {
    super.dispose();
    firstNumberController.dispose();
    secndNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
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
          "Basic Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: CalculatorSizes.appBarTitle(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: CalculatorSizes.calculationContainerHeight(context),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter first number:",
                            style: TextStyle(
                                fontSize:
                                    CalculatorSizes.headingFontSizes(context),
                                color: Colors.green,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            height: 30,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(
                                          context)),
                              keyboardType: TextInputType.phone,
                              controller: firstNumberController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Enter second number:",
                            style: TextStyle(
                                fontSize:
                                    CalculatorSizes.headingFontSizes(context),
                                color: Colors.green,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            height: 30,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(
                                          context)),
                              controller: secndNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Output:",
                            style: TextStyle(
                                fontSize:
                                    CalculatorSizes.headingFontSizes(context),
                                color: Colors.green,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          if (selectedOperation ==
                                  SelectedOperation.subtraction &&
                              sub.isNotEmpty)
                            Text(
                              "Sub is: ${sub.toString()}",
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(context),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          else if (selectedOperation ==
                                  SelectedOperation.addition &&
                              sum.isNotEmpty)
                            Text(
                              "Sum is: ${sum.toString()}",
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(context),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          else if (selectedOperation ==
                                  SelectedOperation.multiplication &&
                              mul.isNotEmpty)
                            Text(
                              "Multiplication is: ${mul.toString()}",
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(context),
                                  color: const Color.fromARGB(255, 14, 14, 14),
                                  fontWeight: FontWeight.bold),
                            )
                          else if (selectedOperation ==
                                  SelectedOperation.division &&
                              div.isNotEmpty)
                            Text(
                              "Division is: ${div.toString()}",
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(context),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          else if (selectedOperation ==
                                  SelectedOperation.percentage &&
                              percentage.isNotEmpty)
                            Text(
                              "Percentage is: ${percentage.toString()}",
                              style: TextStyle(
                                  fontSize: CalculatorSizes
                                      .textFormFieldAndOutputFontSizes(context),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                        ]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            if (!BasicCalculaterResponsive.smallMobile(context))
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedOperation = SelectedOperation.addition;
                          performOperation(firstNumberController.text,
                              secndNumberController.text);
                        },
                        child: ReusableContainer(
                          text: "+",
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            selectedOperation = SelectedOperation.subtraction;
                            performOperation(firstNumberController.text,
                                secndNumberController.text);
                          },
                          child: ReusableContainer(text: "-")),
                      InkWell(
                        onTap: () {
                          resetCalculator();
                        },
                        child: ReusableContainer(text: "Clear"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedOperation = SelectedOperation.multiplication;
                          performOperation(firstNumberController.text,
                              secndNumberController.text);
                        },
                        child: ReusableContainer(
                          text: "x",
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            selectedOperation = SelectedOperation.division;
                            performOperation(firstNumberController.text,
                                secndNumberController.text);
                          },
                          child: ReusableContainer(text: "/")),
                      InkWell(
                        onTap: () {
                          selectedOperation = SelectedOperation.percentage;
                          performOperation(firstNumberController.text,
                              secndNumberController.text);
                        },
                        child: ReusableContainer(text: "%"),
                      )
                    ],
                  ),
                ],
              ),
            if (BasicCalculaterResponsive.smallMobile(context))
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedOperation = SelectedOperation.addition;
                          performOperation(firstNumberController.text,
                              secndNumberController.text);
                        },
                        child: ReusableContainer(
                          text: "+",
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            selectedOperation = SelectedOperation.subtraction;
                            performOperation(firstNumberController.text,
                                secndNumberController.text);
                          },
                          child: ReusableContainer(text: "-")),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedOperation = SelectedOperation.multiplication;
                          performOperation(firstNumberController.text,
                              secndNumberController.text);
                        },
                        child: ReusableContainer(
                          text: "x",
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            selectedOperation = SelectedOperation.division;
                            performOperation(firstNumberController.text,
                                secndNumberController.text);
                          },
                          child: ReusableContainer(text: "/")),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          resetCalculator();
                        },
                        child: ReusableContainer(text: "Clear"),
                      ),
                      InkWell(
                        onTap: () {
                          selectedOperation = SelectedOperation.percentage;
                          performOperation(firstNumberController.text,
                              secndNumberController.text);
                        },
                        child: ReusableContainer(text: "%"),
                      )
                    ],
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableContainer extends StatefulWidget {
  String text;
  ReusableContainer({super.key, required this.text});

  @override
  State<ReusableContainer> createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: CalculatorSizes.operatorsContainerHieght(context),
      width: CalculatorSizes.operatorsContainerWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green,
        border: Border.all(width: 1, color: const Color(0xff000000)),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xff000000),
              fontSize: CalculatorSizes.operatorsTextFontSize(context)),
        ),
      ),
    );
  }
}
