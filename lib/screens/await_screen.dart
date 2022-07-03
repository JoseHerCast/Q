import 'package:flutter/material.dart';
import 'package:licencias/screens/login_screen.dart';
import 'package:licencias/styles/global_styles.dart';

class AwaitScreen extends StatelessWidget {
  const AwaitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "assets/images/success.png",
                        width: 200,
                        color: CustomColors.subBlue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      alignment: Alignment.center,
                      child: Text(
                        "¡Tu solicitud ha sido registrada correctamente! Solo falta validar algunos datos, espera nuestra respuesta dentro de las próximas 72 hrs.",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
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
                  "Continuar",
                  style: TextStyle(color: CustomColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
