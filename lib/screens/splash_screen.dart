import 'dart:async';

import 'package:flutter/material.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: LoginScreen(),
        duration: Duration(milliseconds: 1200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.subBlue,
              gradient: LinearGradient(
                colors: [CustomColors.lightBlue, CustomColors.clearBlue],
                begin: Alignment.topCenter,
                end: Alignment(0.5, 2),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Image.asset(
                "assets/images/Queretaro_Logo.png",
                width: 65,
              ),
            ),
          )
        ],
      ),
    );
  }
}
