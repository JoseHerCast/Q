import 'package:flutter/material.dart';
import 'package:licencias/screens/home_screen.dart';
import 'package:licencias/screens/login_screen.dart';
import 'package:licencias/widgets/stepper_form.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Registro de solicitud',
            style: TextStyle(color: Color(0xff4d6999)),
          ),
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: StepperForm(),
        ),
      ),
    );
  }
}
