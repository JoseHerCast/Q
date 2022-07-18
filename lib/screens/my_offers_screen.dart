import 'package:flutter/material.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/main_appbar.dart';
import 'package:licencias/widgets/simple_form_input.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyOffersScreen extends StatefulWidget {
  MyOffersScreen({Key? key}) : super(key: key);

  @override
  State<MyOffersScreen> createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: MainAppbar(title: 'Mis ofertas'),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                height: 260,
                /* decoration: BoxDecoration(
                  color: CustomColors.white,
                ), */
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 500,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Nueva oferta",
                                  style: TextStyle(
                                      fontSize: Fonts.biggestFontSize),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FormSimpleInput(
                              margin: EdgeInsets.only(),
                              controller: title,
                              hintText: "Titulo",
                            ),
                            FormSimpleInput(
                              margin: EdgeInsets.only(),
                              controller: description,
                              hintText: "Descripción",
                              textMultiline: true,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 30),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 54,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        CustomColors.subBlue,
                                        CustomColors.softBlue,
                                      ],
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
                                  "Crear",
                                  style: TextStyle(color: CustomColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CustomColors.optionWhite,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: CustomColors.shadowWhite),
                      ],
                    ),
                    child: Icon(
                      LineIcons.plus,
                      size: 48,
                      color: CustomColors.subBlue,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Aun no cuentas con ofertas publicada",
                    style: TextStyle(
                        color: CustomColors.softGrey,
                        fontSize: Fonts.smallFontSize),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
