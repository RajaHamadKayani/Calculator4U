import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';

enum SelectedOperation { addition, multipli }

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  State<GPACalculator> createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator>
    with SingleTickerProviderStateMixin {
  TextEditingController secondSubjectNumbers = TextEditingController();
  TextEditingController thirdSubjectNumbers = TextEditingController();
  TextEditingController fourthSubjectNumbers = TextEditingController();

  TextEditingController fifthSubjectNumbers = TextEditingController();
  TextEditingController firstSubjectCreditHours = TextEditingController();
  TextEditingController secondSubjectCreditHours = TextEditingController();
  TextEditingController thirdSubjectCreditHours = TextEditingController();
  TextEditingController fourthSubjectCreditHours = TextEditingController();

  TextEditingController fifthSubjectCreditHours = TextEditingController();
  TextEditingController firstSubjectNumbers = TextEditingController();
  String subjectOneGpa = '';
  String totalCreditHour = "";
  String totalObtainedGpa = '';
  String gpa = "";
  void gpaCalculationMethod() {
    double gpaIs =
        double.parse(totalObtainedGpa) / double.parse(totalCreditHour);
    gpa = gpaIs.toStringAsFixed(2);
  }

  void totalCreditHoursMethod() {
    double totalCreditHours = double.parse(firstSubjectCreditHours.text) +
        double.parse(secondSubjectCreditHours.text) +
        double.parse(thirdSubjectCreditHours.text) +
        double.parse(fourthSubjectCreditHours.text) +
        double.parse(fifthSubjectCreditHours.text);
    totalCreditHour = totalCreditHours.toStringAsFixed(2);
  }

  void totalObtainGpaMethod() {
    double totalObtainGpaInDouble = double.parse(firstSubjectCreditHours.text) *
            double.parse(subjectOneGpa) +
        double.parse(secondSubjectCreditHours.text) *
            double.parse(subjectTwoGpa) +
        double.parse(thirdSubjectCreditHours.text) *
            double.parse(subjectThreeGpa) +
        double.parse(fourthSubjectCreditHours.text) *
            double.parse(subjectFourGpa) +
        double.parse(fifthSubjectCreditHours.text) *
            double.parse(subjectFiveGpa);
    totalObtainedGpa = totalObtainGpaInDouble.toStringAsFixed(2);
  }

  double subjectsGpaCalculation() {
    double number = double.parse(firstSubjectNumbers.text);
    if (number >= 85 && number <= 100) {
      subjectOneGpa = "4.00";
      return double.parse(subjectOneGpa);
    } else if (number < 85 && number >= 80) {
      subjectOneGpa = "3.70";
      return double.parse(subjectOneGpa);
    } else if (number >= 75 && number <= 79) {
      subjectOneGpa = "3.30";
      return double.parse(subjectOneGpa);
    } else if (number >= 70 && number <= 74) {
      subjectOneGpa = "3.00";
      return double.parse(subjectOneGpa);
    } else if (number <= 69 && number >= 65) {
      subjectOneGpa = "2.70";
      return double.parse(subjectOneGpa);
    } else if (number <= 64 && number >= 61) {
      subjectOneGpa = "2.30";
      return double.parse(subjectOneGpa);
    } else if (number <= 60 && number >= 58) {
      subjectOneGpa = "2.00";
      return double.parse(subjectOneGpa);
    } else if (number <= 57 && number >= 55) {
      subjectOneGpa = "1.70";
      return double.parse(subjectOneGpa);
    } else if (number <= 54 && number >= 50) {
      subjectOneGpa = "1.70";
      return double.parse(subjectOneGpa);
    } else {
      subjectOneGpa = "0.00";
      return double.parse(subjectOneGpa);
    }
  }

  @override
  void initState() {
    super.initState();

    // Add a listener to the firstSubjectNumbers controller
    firstSubjectNumbers.addListener(calculateAndSetGpa);
    secondSubjectNumbers.addListener(calculateAndSetGpaSecond);
    thirdSubjectNumbers.addListener(calculateAndSetGpaThird);
    fourthSubjectNumbers.addListener(calculateAndSetGpaFourth);
    fifthSubjectNumbers.addListener(calculateAndSetGpaFifth);
    fifthSubjectCreditHours.addListener(totalCreditHoursMethod);
    fourthSubjectCreditHours.addListener(totalCreditHoursMethod);
    secondSubjectCreditHours.addListener(totalCreditHoursMethod);
    firstSubjectCreditHours.addListener(totalCreditHoursMethod);
    thirdSubjectCreditHours.addListener(totalCreditHoursMethod);
    fifthSubjectCreditHours.addListener(totalObtainGpaMethod);
    fourthSubjectCreditHours.addListener(totalObtainGpaMethod);
    secondSubjectCreditHours.addListener(totalObtainGpaMethod);
    firstSubjectCreditHours.addListener(totalObtainGpaMethod);
    thirdSubjectCreditHours.addListener(totalObtainGpaMethod);
    fifthSubjectCreditHours.addListener(gpaCalculationMethod);
    fourthSubjectCreditHours.addListener(gpaCalculationMethod);
    secondSubjectCreditHours.addListener(gpaCalculationMethod);
    firstSubjectCreditHours.addListener(gpaCalculationMethod);
    thirdSubjectCreditHours.addListener(gpaCalculationMethod);
  }

  void calculateAndSetGpa() {
    setState(() {
      // Call the GPA calculation method and update the GPA value
      subjectOneGpa = subjectsGpaCalculation().toString();
    });
  }

  String subjectTwoGpa = '';
  double secondSubjectsGpaCalculation() {
    double number = double.parse(secondSubjectNumbers.text);
    if (number >= 85 && number <= 100) {
      subjectTwoGpa = "4.00";
      return double.parse(subjectTwoGpa);
    } else if (number < 85 && number >= 80) {
      subjectTwoGpa = "3.70";
      return double.parse(subjectTwoGpa);
    } else if (number >= 75 && number <= 79) {
      subjectTwoGpa = "3.30";
      return double.parse(subjectTwoGpa);
    } else if (number >= 70 && number <= 74) {
      subjectTwoGpa = "3.00";
      return double.parse(subjectTwoGpa);
    } else if (number <= 69 && number >= 65) {
      subjectTwoGpa = "2.70";
      return double.parse(subjectTwoGpa);
    } else if (number <= 64 && number >= 61) {
      subjectTwoGpa = "2.30";
      return double.parse(subjectTwoGpa);
    } else if (number <= 60 && number >= 58) {
      subjectTwoGpa = "2.00";
      return double.parse(subjectTwoGpa);
    } else if (number <= 57 && number >= 55) {
      subjectTwoGpa = "1.70";
      return double.parse(subjectTwoGpa);
    } else if (number <= 54 && number >= 50) {
      subjectTwoGpa = "1.70";
      return double.parse(subjectTwoGpa);
    } else {
      subjectTwoGpa = "0.00";
      return double.parse(subjectTwoGpa);
    }
  }

  void calculateAndSetGpaSecond() {
    setState(() {
      // Call the GPA calculation method and update the GPA value
      subjectTwoGpa = secondSubjectsGpaCalculation().toString();
    });
  }

  String subjectThreeGpa = '';
  double thirdSubjectsGpaCalculation() {
    double number = double.parse(thirdSubjectNumbers.text);
    if (number >= 85 && number <= 100) {
      subjectThreeGpa = "4.00";
      return double.parse(subjectThreeGpa);
    } else if (number < 85 && number >= 80) {
      subjectThreeGpa = "3.70";
      return double.parse(subjectThreeGpa);
    } else if (number >= 75 && number <= 79) {
      subjectThreeGpa = "3.30";
      return double.parse(subjectThreeGpa);
    } else if (number >= 70 && number <= 74) {
      subjectThreeGpa = "3.00";
      return double.parse(subjectThreeGpa);
    } else if (number <= 69 && number >= 65) {
      subjectThreeGpa = "2.70";
      return double.parse(subjectThreeGpa);
    } else if (number <= 64 && number >= 61) {
      subjectThreeGpa = "2.30";
      return double.parse(subjectThreeGpa);
    } else if (number <= 60 && number >= 58) {
      subjectThreeGpa = "2.00";
      return double.parse(subjectThreeGpa);
    } else if (number <= 57 && number >= 55) {
      subjectThreeGpa = "1.70";
      return double.parse(subjectThreeGpa);
    } else if (number <= 54 && number >= 50) {
      subjectThreeGpa = "1.70";
      return double.parse(subjectThreeGpa);
    } else {
      subjectThreeGpa = "0.00";
      return double.parse(subjectThreeGpa);
    }
  }

  void calculateAndSetGpaThird() {
    setState(() {
      // Call the GPA calculation method and update the GPA value
      subjectThreeGpa = thirdSubjectsGpaCalculation().toString();
    });
  }

  String subjectFourGpa = '';
  double fourthSubjectsGpaCalculation() {
    double number = double.parse(fourthSubjectNumbers.text);
    if (number >= 85 && number <= 100) {
      subjectFourGpa = "4.00";
      return double.parse(subjectFourGpa);
    } else if (number < 85 && number >= 80) {
      subjectFourGpa = "3.70";
      return double.parse(subjectFourGpa);
    } else if (number >= 75 && number <= 79) {
      subjectFourGpa = "3.30";
      return double.parse(subjectFourGpa);
    } else if (number >= 70 && number <= 74) {
      subjectFourGpa = "3.00";
      return double.parse(subjectFourGpa);
    } else if (number <= 69 && number >= 65) {
      subjectFourGpa = "2.70";
      return double.parse(subjectFourGpa);
    } else if (number <= 64 && number >= 61) {
      subjectFourGpa = "2.30";
      return double.parse(subjectFourGpa);
    } else if (number <= 60 && number >= 58) {
      subjectFourGpa = "2.00";
      return double.parse(subjectFourGpa);
    } else if (number <= 57 && number >= 55) {
      subjectFourGpa = "1.70";
      return double.parse(subjectFourGpa);
    } else if (number <= 54 && number >= 50) {
      subjectFourGpa = "1.70";
      return double.parse(subjectFourGpa);
    } else {
      subjectFourGpa = "0.00";
      return double.parse(subjectFourGpa);
    }
  }

  void calculateAndSetGpaFourth() {
    setState(() {
      // Call the GPA calculation method and update the GPA value
      subjectFourGpa = fourthSubjectsGpaCalculation().toString();
    });
  }

  String subjectFiveGpa = '';
  double fifthSubjectsGpaCalculation() {
    double number = double.parse(fifthSubjectNumbers.text);
    if (number >= 85 && number <= 100) {
      subjectFiveGpa = "4.00";
      return double.parse(subjectFiveGpa);
    } else if (number < 85 && number >= 80) {
      subjectFiveGpa = "3.70";
      return double.parse(subjectFiveGpa);
    } else if (number >= 75 && number <= 79) {
      subjectFiveGpa = "3.30";
      return double.parse(subjectFiveGpa);
    } else if (number >= 70 && number <= 74) {
      subjectFiveGpa = "3.00";
      return double.parse(subjectFiveGpa);
    } else if (number <= 69 && number >= 65) {
      subjectFiveGpa = "2.70";
      return double.parse(subjectFiveGpa);
    } else if (number <= 64 && number >= 61) {
      subjectFiveGpa = "2.30";
      return double.parse(subjectFiveGpa);
    } else if (number <= 60 && number >= 58) {
      subjectFiveGpa = "2.00";
      return double.parse(subjectFiveGpa);
    } else if (number <= 57 && number >= 55) {
      subjectFiveGpa = "1.70";
      return double.parse(subjectFiveGpa);
    } else if (number <= 54 && number >= 50) {
      subjectFiveGpa = "1.70";
      return double.parse(subjectFiveGpa);
    } else {
      subjectFiveGpa = "0.00";
      return double.parse(subjectFiveGpa);
    }
  }

  void calculateAndSetGpaFifth() {
    setState(() {
      // Call the GPA calculation method and update the GPA value
      subjectFiveGpa = fifthSubjectsGpaCalculation().toString();
    });
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
          "GPA Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: CalculatorSizes.appBarTitle(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subject marks",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Credit Hours",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "GPA",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResuableContainer(
                      textEditingController: firstSubjectNumbers,
                      hintText: "Enter marks"),
                  ResuableContainer(
                      textEditingController: firstSubjectCreditHours,
                      hintText: "Enter credit hours"),
                  Text(
                    subjectOneGpa.toString(),
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResuableContainer(
                      textEditingController: secondSubjectNumbers,
                      hintText: "Enter marks"),
                  ResuableContainer(
                      textEditingController: secondSubjectCreditHours,
                      hintText: "Enter credit hours"),
                  Text(
                    subjectTwoGpa.toString(),
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResuableContainer(
                      textEditingController: thirdSubjectNumbers,
                      hintText: "Enter marks"),
                  ResuableContainer(
                      textEditingController: thirdSubjectCreditHours,
                      hintText: "Enter credit hours"),
                  Text(
                    subjectThreeGpa.toString(),
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResuableContainer(
                      textEditingController: fourthSubjectNumbers,
                      hintText: "Enter marks"),
                  ResuableContainer(
                      textEditingController: fourthSubjectCreditHours,
                      hintText: "Enter credit hours"),
                  Text(
                    subjectFourGpa.toString(),
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResuableContainer(
                      textEditingController: fifthSubjectNumbers,
                      hintText: "Enter marks"),
                  ResuableContainer(
                      textEditingController: fifthSubjectCreditHours,
                      hintText: "Enter credit hours"),
                  Text(
                    subjectFiveGpa.toString(),
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Your total credit hours are:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16)),
                TextSpan(
                    text: "$totalCreditHour",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green))
              ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Your total obtained GPA is:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16)),
                TextSpan(
                    text: "$totalObtainedGpa",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green))
              ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text("Your Grade Point Average (GPA) is:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text(
                  "$gpa",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ResuableContainer extends StatefulWidget {
  String hintText;
  TextEditingController textEditingController;
  ResuableContainer(
      {super.key, required this.textEditingController, required this.hintText});

  @override
  State<ResuableContainer> createState() => _ResuableContainerState();
}

class _ResuableContainerState extends State<ResuableContainer> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (hasFocus) {
        setState(() {});
      },
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: focusNode.hasFocus ? Colors.green : Colors.white,
                width: 2)),
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          child: TextFormField(
            style: TextStyle(
                color: Color(0xffffffff), fontWeight: FontWeight.bold),
            controller: widget.textEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: CalculatorSizes.hintTextFontSize(context))),
          ),
        ),
      ),
    );
  }
}
