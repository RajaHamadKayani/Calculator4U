import 'package:flutter/material.dart';
import 'package:gpa_calculator_4u/basic_calculator/basic_calculator_sizes/basic_calculator_sizes.dart';
import 'package:gpa_calculator_4u/constants/constant.dart';
import 'package:gpa_calculator_4u/utils/routes/routes_names.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double value = 0;
  late AnimationController _controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, RouteName.basicCal);
        break;
      case 1:
        Navigator.pushNamed(context, RouteName.aggregateCal);
        break;
      case 2:
        Navigator.pushNamed(context, RouteName.cgpaCal);
        break;
      case 3:
        Navigator.pushNamed(context, RouteName.gpaCal);
        break;
      case 4:
        Navigator.pushNamed(context, RouteName.ageCal);
        break;
      case 5:
        Navigator.pushNamed(context, RouteName.healthCal);
        // Add more cases for other screens as needed
        break;
      default:
        // Handle cases for other indices if necessary
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.lightGreen.shade800,
              Colors.lightGreen.shade900,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Container(
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.homeScreen);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration:const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DrawerHeader(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/profile.jpg")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        "Raja Hamad",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff)),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  MyListTileComponent(
                    icon: Icons.calculate,
                    title: "Grade Point Average (GPA)",
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.gpaCal);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  MyListTileComponent(
                    icon: Icons.calculate,
                    title: "Cumulative Grade Point Average (CGPA)",
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.cgpaCal);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  MyListTileComponent(
                    icon: Icons.calculate,
                    title: "Basic Calculator",
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.basicCal);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  MyListTileComponent(
                    icon: Icons.calculate,
                    title: "Age Calculator",
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.ageCal);
                    },
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * value)
                    ..rotateY((pi / 6) * value),
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      backgroundColor: Colors.green,
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            value == 0 ? value = 1 : value = 0;
                          });
                        },
                        icon: Icon(
                          Icons.menu,
                          size: CalculatorSizes.appBarIcon(context),
                        ),
                        color: Colors.black,
                      ),
                      title: Text(
                        "Calculator",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: CalculatorSizes.appBarTitle(context),
                        ),
                      ),
                    ),
                    key: _scaffoldKey,
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 300,
                                width: 300,
                                child: Lottie.asset(
                                  "assets/json/home_screen_logo.json",
                                  onLoaded: (composition) {
                                    _controller.duration = composition.duration;
                                    _controller.repeat();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            Center(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Calculator ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "4U",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "All Calculators",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color(0xffffffff)),
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: AppConstants.gridText.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      crossAxisSpacing:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          _navigateToScreen(context,
                                              index); // Navigate to the desired screen
                                        },
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff1A1110),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(AppConstants
                                                          .assetImagesBgColor[
                                                      index]),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    AppConstants
                                                        .assetImages[index],
                                                    fit: BoxFit
                                                        .cover, // Use BoxFit.cover here
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      10), // Add some spacing
                                              Text(
                                                AppConstants.gridText[index],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xffffffff)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class MyListTileComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MyListTileComponent({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: CalculatorSizes.drawerTextFontSize(context),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Icon(
          icon,
          size: CalculatorSizes.drawerIconSize(context),
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
