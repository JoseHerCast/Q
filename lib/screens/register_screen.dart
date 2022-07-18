import 'package:flutter/material.dart';
import 'package:licencias/screens/home_screen.dart';
import 'package:licencias/screens/login_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/main_appbar.dart';
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
        appBar: MainAppbar(title: 'Registro de solicitud'),
        body: SingleChildScrollView(
          child: StepperForm(),
        ),
      ),
    );
  }
}
