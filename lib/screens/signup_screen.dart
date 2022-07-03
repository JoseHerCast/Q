import 'package:flutter/material.dart';
import 'package:licencias/screens/home_screen.dart';
import 'package:licencias/screens/login_screen.dart';
import 'package:licencias/screens/register_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/stepper_form.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
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
                        width: 250,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Registro",
                        style: TextStyle(
                            fontSize: 16, color: CustomColors.subBlue),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                    LineIcons.user,
                    color: CustomColors.subBlue,
                  ),
                  hintText: "Nombre",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  hintText: "Correo electrónico",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
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
            /* En el registro no debería poder acceder directamente a la aplicación */
            GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
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
                      colors: [CustomColors.subBlue, CustomColors.softBlue],
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
                  "Registrarse",
                  style: TextStyle(color: CustomColors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿Ya tienes una cuenta?  "),
                  GestureDetector(
                    child: Text(
                      "Ingresa ¡ya!",
                      style: TextStyle(color: CustomColors.subBlue),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          child: LoginScreen(),
                          duration: Duration(milliseconds: 600),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
