import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/aggregate_calculator/sizes/sizes.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';
import 'package:lottie/lottie.dart';

class AggregateCalculator extends StatefulWidget {
  const AggregateCalculator({super.key});

  @override
  State<AggregateCalculator> createState() => _AggregateCalculatorState();
}

class _AggregateCalculatorState extends State<AggregateCalculator>
    with SingleTickerProviderStateMixin {
  void dispose(){
    matricObtainController.dispose();
    matricTotalController.dispose();
    interObtainController.dispose();
    interTotalController.dispose();
    entryTestObtainController.dispose();
    entryTextTotalController.dispose();
  }
  late AnimationController animationController;
  String sumOfTotalMarksOfAllPrograms = '';
  String sumOfTotalMarks() {
    double value = double.parse(matricTotalController.text) +
        double.parse(interTotalController.text) +
        double.parse(entryTextTotalController.text);
    sumOfTotalMarksOfAllPrograms = value.toString();
    return sumOfTotalMarksOfAllPrograms;
  }

  void setSumOfTotalMarks() {
    sumOfTotalMarksOfAllPrograms = sumOfTotalMarks().toString();
  }

  String sumOfObtainMarksOfAllPrograms = '';
  String sumOfObtainMarks() {
    double value = double.parse(matricObtainController.text) +
        double.parse(interObtainController.text) +
        double.parse(entryTestObtainController.text);
    sumOfObtainMarksOfAllPrograms = value.toString();
    return sumOfObtainMarksOfAllPrograms;
  }

  void setSumOfObtainMarks() {
    sumOfObtainMarksOfAllPrograms = sumOfObtainMarks().toString();
  }

  String aggregate = '';
  String aggregatePercentage() {
    double value = double.parse(sumOfObtainMarksOfAllPrograms) /
        double.parse(sumOfTotalMarksOfAllPrograms);
    aggregate = value.toString();
    return aggregate;
  }

  void setAggregate() {
    aggregate = aggregatePercentage().toString();
  }

  String aggregateValue = '';
  String aggregatePercentageValue() {
    double value = double.parse(aggregate);
    aggregateValue = value.toString();
    return aggregateValue;
  }

  void setAggregateValue() {
    aggregateValue = aggregatePercentageValue().toString();
  }
  String finalValue = '';
  String finalvalue() {
    double value = double.parse(aggregate) * 100;
    aggregateValue = value.toString();
    return aggregateValue;
  }

  void setFinalValue() {
    finalValue = finalvalue.toString();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    matricTotalController.addListener(setSumOfTotalMarks);
    interTotalController.addListener(setSumOfTotalMarks);
    entryTextTotalController.addListener(setSumOfTotalMarks);
    matricObtainController.addListener(setSumOfObtainMarks);
    interObtainController.addListener(setSumOfObtainMarks);
    entryTestObtainController.addListener(setSumOfObtainMarks);
    matricTotalController.addListener(setAggregate);
    interTotalController.addListener(setAggregate);
    entryTextTotalController.addListener(setAggregate);
    matricObtainController.addListener(setAggregate);
    interObtainController.addListener(setAggregate);
    entryTestObtainController.addListener(setAggregate);

    matricTotalController.addListener(setAggregateValue);
    matricObtainController.addListener(setAggregateValue);

    interTotalController.addListener(setAggregateValue);

    interObtainController.addListener(setAggregateValue);

    entryTextTotalController.addListener(setAggregateValue);

    entryTestObtainController.addListener(setAggregateValue);
    matricTotalController.addListener(setFinalValue);
    matricObtainController.addListener(setFinalValue);

    interTotalController.addListener(setFinalValue);

    interObtainController.addListener(setFinalValue);

    entryTextTotalController.addListener(setFinalValue);

    entryTestObtainController.addListener(setFinalValue);
  }

  TextEditingController matricTotalController = TextEditingController();
  TextEditingController matricObtainController = TextEditingController();
  TextEditingController interTotalController = TextEditingController();
  TextEditingController interObtainController = TextEditingController();
  TextEditingController entryTextTotalController = TextEditingController();
  TextEditingController entryTestObtainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Aggregate Calculator",
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
                child: Lottie.asset("assets/json/aggregate_calculator.json",
                    onLoaded: (composition) {
                  animationController.duration = composition.duration;
                  animationController.repeat();
                }),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.04,
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableComponent(
                      controller1: matricTotalController,
                      hintText1: "Enter Total Marks",
                      rowText1: "Total",
                      title: "Matric Marks",
                      controller2: matricObtainController,
                      hintText2: "Enter Obtain Marks",
                      rowText2: "Obtained"),
                  ReusableComponent(
                      controller1: interTotalController,
                      hintText1: "Enter Total Marks",
                      rowText1: "Total",
                      title: "Intermediate Marks",
                      controller2: interObtainController,
                      hintText2: "Enter Obtain Marks",
                      rowText2: "Obtained"),
                  ReusableComponent(
                      controller1: entryTextTotalController,
                      hintText1: "Enter Total Marks",
                      rowText1: "Total",
                      title: "Entry Test Marks",
                      controller2: entryTestObtainController,
                      hintText2: "Enter Obtain Marks",
                      rowText2: "Obtained"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Aggregate is ",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.calculateTextFontSize(context))),
                      TextSpan(
                          text: "$finalValue",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.calculateTextFontSize(context))),
                    ])),
                  )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableComponent extends StatefulWidget {
  String title;
  String rowText1;
  TextEditingController controller1;
  String hintText1;
  String rowText2;
  TextEditingController controller2;
  String hintText2;
  ReusableComponent(
      {super.key,
      required this.controller1,
      required this.hintText1,
      required this.rowText1,
      required this.title,
      required this.controller2,
      required this.hintText2,
      required this.rowText2});

  @override
  State<ReusableComponent> createState() => _ReusableComponentState();
}

class _ReusableComponentState extends State<ReusableComponent> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: Sizes.titleTextFontSize(context),
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.rowText1,
              style: TextStyle(
                  fontSize: Sizes.rowTextFontSize(context),
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffffffff)),
            ),
            Focus(
              focusNode: focusNode1,
              onFocusChange: (hasFocus) {
                setState(() {});
              },
              child: Container(
                height: Sizes.textFormFieldHeight(context),
                width: Sizes.textFormFieldWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: focusNode1.hasFocus
                            ? Colors.green
                            : const Color(0xffffffff),
                        width: focusNode1.hasFocus ? 2 : 1)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffffffff)),
                    controller: widget.controller1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText1,
                        hintStyle: TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontSize: Sizes.hintTextFontSize(context))),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.rowText2,
              style: TextStyle(
                  fontSize: Sizes.rowTextFontSize(context),
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffffffff)),
            ),
            Focus(
              focusNode: focusNode2,
              onFocusChange: (hasFocus) {
                setState(() {});
              },
              child: Container(
                height: Sizes.textFormFieldHeight(context),
                width: Sizes.textFormFieldWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: focusNode2.hasFocus
                            ? Colors.green
                            : const Color(0xffffffff),
                        width: focusNode2.hasFocus ? 2 : 1)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffffffff)),
                    controller: widget.controller2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText2,
                        hintStyle: TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontSize: Sizes.hintTextFontSize(context))),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
