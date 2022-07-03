import 'dart:io';

import 'package:flutter/material.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: CustomColors.subBlue,
              gradient: LinearGradient(
                colors: [CustomColors.lightBlue, CustomColors.clearBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/images/Queretaro_Juntos_Adelante.png",
                    width: 300,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30, top: 30),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Inicio",
                    style: TextStyle(
                      fontSize: Fonts.mediumFontSize,
                      color: CustomColors.subBlue,
                    ),
                  ),
                )
              ],
            )),
          ),
          /* Email field */
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: CustomColors.lightGrey,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: CustomColors.shadowWhite),
              ],
            ),
            child: TextField(
              cursorColor: CustomColors.subBlue,
              decoration: InputDecoration(
                icon: Icon(
                  LineIcons.envelope,
                  color: CustomColors.subBlue,
                ),
                hintText: "Correo",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          /* Password Field */
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: CustomColors.shadowWhite,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: CustomColors.shadowWhite),
              ],
            ),
            child: TextField(
              cursorColor: CustomColors.subBlue,
              decoration: InputDecoration(
                focusColor: CustomColors.subBlue,
                icon: Icon(
                  LineIcons.key,
                  color: CustomColors.subBlue,
                ),
                hintText: "Contraseña",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          /* Forgot Password */
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Write Click Listener Code Here
              },
              child: Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(
                  fontSize: Fonts.smallestFontSize,
                ),
              ),
            ),
          ),
          /* LOGIN */
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(title: 'Demo Licenciamiento Queretaro'),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(CustomColors.subBlue), CustomColors.lightBlue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: CustomColors.lightGrey,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: CustomColors.shadowWhite),
                ],
              ),
              child: Text(
                "Iniciar sesión",
                style: TextStyle(
                  fontSize: Fonts.smallFontSize,
                  color: CustomColors.white,
                ),
              ),
            ),
          ),
          /* Dont have any account */
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Aún no te has registrado?  ",
                  style: TextStyle(
                    fontSize: Fonts.smallestFontSize,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Registrate ¡ya!",
                    style: TextStyle(
                      color: CustomColors.subBlue,
                      fontSize: Fonts.smallestFontSize,
                    ),
                  ),
                  onTap: () {
                    // Write Tap Code Here.
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: SignUpScreen(),
                        duration: Duration(milliseconds: 600),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}
