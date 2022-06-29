import 'dart:io';

import 'package:flutter/material.dart';
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
              color: new Color(0xff4d6999),
              gradient: LinearGradient(
                colors: [(new Color(0xff76a6cf)), new Color(0xffe8f0f7)],
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
                    style: TextStyle(fontSize: 16, color: Color(0xff4d6999)),
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
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextField(
              cursorColor: Color(0xff4d6999),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Color(0xff4d6999),
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
              color: Color(0xffEEEEEE),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextField(
              cursorColor: Color(0xff4d6999),
              decoration: InputDecoration(
                focusColor: Color(0xff4d6999),
                icon: Icon(
                  Icons.vpn_key,
                  color: Color(0xff4d6999),
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
              child: Text("¿Olvidaste tu contraseña? "),
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
                    colors: [(new Color(0xff4d6999)), new Color(0xff6693c2)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Text(
                "Iniciar sesión",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          /* Dont have any account */
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Aún no te has registrado?  "),
                GestureDetector(
                  child: Text(
                    "Registrate ¡ya!",
                    style: TextStyle(color: Color(0xff4d6999)),
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
