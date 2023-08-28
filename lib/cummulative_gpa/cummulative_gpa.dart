import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';

class CummulativeGpa extends StatefulWidget {
  const CummulativeGpa({super.key});

  @override
  State<CummulativeGpa> createState() => _CummulativeGpaState();
}

class _CummulativeGpaState extends State<CummulativeGpa> {
  void dispose(){
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    sixthController.dispose();
    seventhController.dispose();
    eightController.dispose();
    firstCreditHour.dispose();
    secondCreditHour.dispose();
    thirdCreditHour.dispose();
    fourthCreditHour.dispose();
    sixthCreditHour.dispose();
    seventhCreditHour.dispose();
    eightCreditHour.dispose();

  }
  String cgpa = "";
  String cummulativeGpa() {
    double value =
        double.parse(totalSumOfWAGpa) / double.parse(totalCreditHours);
    cgpa = value.toString();
    return cgpa;
  }

  void setCummulativeGpa() {
    cgpa = cummulativeGpa().toString();
  }

  TextEditingController firstController = TextEditingController();

  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();
  TextEditingController sixthController = TextEditingController();
  TextEditingController seventhController = TextEditingController();
  TextEditingController eightController = TextEditingController();
  TextEditingController firstCreditHour = TextEditingController();
  TextEditingController secondCreditHour = TextEditingController();
  TextEditingController thirdCreditHour = TextEditingController();
  TextEditingController fourthCreditHour = TextEditingController();
  TextEditingController fifthCreditHour = TextEditingController();
  TextEditingController sixthCreditHour = TextEditingController();
  TextEditingController seventhCreditHour = TextEditingController();
  TextEditingController eightCreditHour = TextEditingController();
  String wAGF = "";

  String weightAvgGpaFirst() {
    double value =
        double.parse(firstController.text) * double.parse(firstCreditHour.text);

    wAGF = value.toString();
    return wAGF;
  }

  void setFirstAvg() {
    wAGF = weightAvgGpaFirst().toString();
  }

  String wAGS = "";

  String weightAvgGpaSecond() {
    double value = double.parse(secondController.text) *
        double.parse(secondCreditHour.text);

    wAGS = value.toString();
    return wAGS;
  }

  void setSecondAvg() {
    wAGS = weightAvgGpaSecond().toString();
  }

  String wAGT = "";

  String weightAvgGpaThird() {
    double value =
        double.parse(thirdController.text) * double.parse(thirdCreditHour.text);

    wAGT = value.toString();
    return wAGT;
  }

  void setThirdAvg() {
    wAGT = weightAvgGpaThird().toString();
  }

  String wAGFo = "";

  String weightAvgGpaFourth() {
    double value = double.parse(fourthController.text) *
        double.parse(fourthCreditHour.text);

    wAGFo = value.toString();
    return wAGFo;
  }

  void setFourthAvg() {
    wAGFo = weightAvgGpaFourth().toString();
  }

  String wAGFi = "";

  String weightAvgGpaFifth() {
    double value =
        double.parse(fifthController.text) * double.parse(fifthCreditHour.text);

    wAGFi = value.toString();
    return wAGFi;
  }

  void setFifthAvg() {
    wAGFi = weightAvgGpaFifth().toString();
  }

  String wAGSix = "";

  String weightAvgGpaSix() {
    double value =
        double.parse(sixthController.text) * double.parse(sixthCreditHour.text);

    wAGSix = value.toString();
    return wAGSix;
  }

  void setSixthAvg() {
    wAGT = weightAvgGpaSix().toString();
  }

  String wAGSe = "";

  String weightAvgGpaSeventh() {
    double value = double.parse(seventhController.text) *
        double.parse(seventhCreditHour.text);

    wAGSe = value.toString();
    return wAGSe;
  }

  void setSeventhAvg() {
    wAGSe = weightAvgGpaSeventh().toString();
  }

  String wAGE = "";

  String weightAvgGpaEight() {
    double value =
        double.parse(eightController.text) * double.parse(eightCreditHour.text);

    wAGE = value.toString();
    return wAGE;
  }

  void setEightAvg() {
    wAGE = weightAvgGpaEight().toString();
  }

  String totalCreditHours = "";

  String totalCreditHoursOfAllSemesters() {
    double totalCH = double.parse(firstCreditHour.text) +
        double.parse(secondCreditHour.text) +
        double.parse(thirdCreditHour.text) +
        double.parse(fourthCreditHour.text) +
        double.parse(fifthCreditHour.text) +
        double.parse(sixthCreditHour.text) +
        double.parse(seventhCreditHour.text) +
        double.parse(eightCreditHour.text);
    totalCreditHours = totalCH.toString();
    return totalCreditHours;
  }

  void setSumOfTotalCreditHoursOfAllSemeters() {
    totalCreditHours = totalCreditHoursOfAllSemesters().toString();
  }

  String totalSumOfWAGpa = '';

  String totalSumOfWeightAvgOfAllSemester() {
    double value = double.parse(wAGF) +
        double.parse(wAGS) +
        double.parse(wAGT) +
        double.parse(wAGFo) +
        double.parse(wAGFi) +
        double.parse(wAGSix) +
        double.parse(wAGSe) +
        double.parse(wAGE);
    totalSumOfWAGpa = value.toString();
    return totalSumOfWAGpa;
  }

  void setSumOfTotalAvgGpaOfAllSemeters() {
    totalSumOfWAGpa = totalSumOfWeightAvgOfAllSemester().toString();
  }

  @override
  void initState() {
    super.initState();
    firstController.addListener(setFirstAvg);
    firstCreditHour.addListener(setFirstAvg);
    secondController.addListener(setSecondAvg);
    secondCreditHour.addListener(setSecondAvg);
    thirdController.addListener(setThirdAvg);
    thirdCreditHour.addListener(setThirdAvg);
    fourthController.addListener(setFourthAvg);
    fourthCreditHour.addListener(setFourthAvg);
    fifthController.addListener(setFifthAvg);
    fifthCreditHour.addListener(setFifthAvg);
    sixthController.addListener(setSixthAvg);
    sixthCreditHour.addListener(setSixthAvg);
    seventhController.addListener(setSeventhAvg);
    seventhCreditHour.addListener(setSeventhAvg);
    eightController.addListener(setEightAvg);
    eightCreditHour.addListener(setEightAvg);
    firstCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    secondCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    thirdCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    fourthCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    fifthCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    sixthCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    seventhCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    eightCreditHour.addListener(setSumOfTotalCreditHoursOfAllSemeters);
    firstController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    firstCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    secondController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    secondCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    thirdController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    thirdCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    fourthController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    fourthCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    fifthController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    fifthCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    sixthController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    sixthCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    seventhController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    seventhCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    eightController.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    eightCreditHour.addListener(setSumOfTotalAvgGpaOfAllSemeters);
    firstController.addListener(setCummulativeGpa);
    firstCreditHour.addListener(setCummulativeGpa);
    secondController.addListener(setCummulativeGpa);
    secondCreditHour.addListener(setCummulativeGpa);
    thirdController.addListener(setCummulativeGpa);
    thirdCreditHour.addListener(setCummulativeGpa);
    fourthController.addListener(setCummulativeGpa);
    fourthCreditHour.addListener(setCummulativeGpa);
    fifthController.addListener(setCummulativeGpa);
    fifthCreditHour.addListener(setCummulativeGpa);
    sixthController.addListener(setCummulativeGpa);
    sixthCreditHour.addListener(setCummulativeGpa);
    seventhController.addListener(setCummulativeGpa);
    seventhCreditHour.addListener(setCummulativeGpa);
    eightController.addListener(setCummulativeGpa);
    eightCreditHour.addListener(setCummulativeGpa);
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
          "CGPA Calculator",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: CalculatorSizes.appBarTitle(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GPA of semesters",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Column(
                    children: [
                      Text(
                        "Sum of credit",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Text(
                        "Hours of semester",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  Column(children: [
                    Text(
                      "Weight Average",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    Text(
                      "GPA",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: firstController,
                      hintText: "gpa of 1st sem"),
                  ResuableContainer(
                      textEditingController: firstCreditHour,
                      hintText: "Sum of crdt hours of 1st sem"),
                  Expanded(
                    child: Text(
                      wAGF.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: secondController,
                      hintText: "gpa of 2nd sem"),
                  ResuableContainer(
                      textEditingController: secondCreditHour,
                      hintText: "Sum of crdt hours of 2nd sem"),
                  Expanded(
                    child: Text(
                      wAGS.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: thirdController,
                      hintText: "gpa of 3rd sem"),
                  ResuableContainer(
                      textEditingController: thirdCreditHour,
                      hintText: "Sum of crdt hours of 3rd sem"),
                  Expanded(
                    child: Text(
                      wAGT.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: fourthController,
                      hintText: "gpa of 4th sem"),
                  ResuableContainer(
                      textEditingController: fourthCreditHour,
                      hintText: "Sum of crdt hours of 4th sem"),
                  Expanded(
                    child: Text(
                      wAGFo.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: fifthController,
                      hintText: "gpa of 5th sem"),
                  ResuableContainer(
                      textEditingController: fifthCreditHour,
                      hintText: "Sum of crdt hours of 5th sem"),
                  Expanded(
                    child: Text(
                      wAGFi.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: sixthController,
                      hintText: "gpa of 6th sem"),
                  ResuableContainer(
                      textEditingController: sixthCreditHour,
                      hintText: "Sum of crdt hours of 6th sem"),
                  Expanded(
                    child: Text(
                      wAGSix.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: seventhController,
                      hintText: "gpa of 7th sem"),
                  ResuableContainer(
                      textEditingController: seventhCreditHour,
                      hintText: "Sum of crdt hours of 7th sem"),
                  Expanded(
                    child: Text(
                      wAGSe.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableContainer(
                      textEditingController: eightController,
                      hintText: "gpa of 8th sem"),
                  ResuableContainer(
                      textEditingController: eightCreditHour,
                      hintText: "Sum of crdt hours of 8th sem"),
                  Expanded(
                    child: Text(
                      wAGE.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Sum of total credit hours of all semesters: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
                TextSpan(
                    text: "$totalCreditHours",
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.green))
              ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Sum of total Weight Average GPA of all semesters: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
                TextSpan(
                    text: "$totalSumOfWAGpa",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green))
              ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                "Your Cummulative Grade Point Average (CGPA) is:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text(
                  "$cgpa",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
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
        height: 30,
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
