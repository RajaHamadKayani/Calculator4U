// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CalculatePercentage extends StatefulWidget {
  const CalculatePercentage({super.key});

  @override
  State<CalculatePercentage> createState() => _CalculatePercentageState();
}

class _CalculatePercentageState extends State<CalculatePercentage> {
  static String percentage = "";
  static percentageMethod(String first, String second) {
    double num1 = double.parse(first);
    double num2 = double.parse(second);
    double result = (num2 / num1) * 100;
    percentage = result.toString();
  }

  static clear() {
    totalMarks.clear();
    obtMarks.clear();
    percentage = '';
  }

  static TextEditingController totalMarks = TextEditingController();
  static TextEditingController obtMarks = TextEditingController();
  showDialogBox(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Percentage",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter total marks:",
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormFieldComponent(
                controller: totalMarks, hintText: "total marks"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "Enter obtain marks:",
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormFieldComponent(
                controller: obtMarks, hintText: "obtain marks"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        percentageMethod(totalMarks.text.toString(),
                            obtMarks.text.toString());
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                                width: 1, color: const Color(0xff000000))),
                        child: const Center(
                          child: Text(
                            "=",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        clear();
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                                width: 1, color: const Color(0xff000000))),
                        child: const Center(
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: Text(
                "Percentage is:$percentage",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff000000)),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TextFormFieldComponent extends StatefulWidget {
  var controller;
  String hintText;
  TextFormFieldComponent(
      {super.key, required this.controller, required this.hintText});

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: const Color(0xff000000))),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.height * 0.01),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.controller,
            decoration: InputDecoration(
                hintText: widget.hintText, border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
