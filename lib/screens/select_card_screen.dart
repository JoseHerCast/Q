import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:licencias/controllers/payment_controller.dart';
import 'package:licencias/screens/credit_card_screen.dart';
import 'package:licencias/screens/home_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SelectCardScreen extends StatefulWidget {
  SelectCardScreen({Key? key}) : super(key: key);

  @override
  State<SelectCardScreen> createState() => _SelectCardScreenState();
}

class _SelectCardScreenState extends State<SelectCardScreen> {
  final paymentController = Get.put(PaymentController());
  int cardSelected = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon:
                Icon(LineIcons.angleLeft, size: 28, color: CustomColors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: CustomColors.lightBlue,
          title: Text(
            "Pago con tarjeta",
            style: TextStyle(color: CustomColors.white),
          ),
          centerTitle: true,
        ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cardSelected = 0;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditCardScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColors.optionWhite,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: CustomColors.shadowWhite),
                          ],
                        ),
                        child: LineIcon(
                          LineIcons.plus,
                          size: 48,
                          color: CustomColors.subBlue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cardSelected = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColors.black,
                          boxShadow: cardSelected == 1
                              ? [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 20,
                                      color: CustomColors.subBlue),
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/mastercard.png',
                                scale: 1.2,
                              ),
                            ),
                            Container(
                              child: Text(
                                '**** 4798',
                                style: TextStyle(
                                    color: CustomColors.white,
                                    fontSize: Fonts.smallFontSize),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Vencimiento\n05/30',
                                style: TextStyle(
                                    color: CustomColors.white,
                                    fontSize: Fonts.smallestFontSize),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cardSelected = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColors.subBlue,
                          boxShadow: cardSelected == 2
                              ? [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 20,
                                      color: CustomColors.subBlue),
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/mastercard.png',
                                scale: 1.2,
                              ),
                            ),
                            Container(
                              child: Text(
                                '**** 4798',
                                style: TextStyle(
                                    color: CustomColors.white,
                                    fontSize: Fonts.smallFontSize),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Vencimiento\n05/30',
                                style: TextStyle(
                                    color: CustomColors.white,
                                    fontSize: Fonts.smallestFontSize),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        paymentController.makePayment(
                            amount: '1299', currency: 'MXN');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 54,
                        width: 160,
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
                          "Continuar",
                          style: TextStyle(color: CustomColors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cardSelected = 0;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 54,
                        width: 160,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                CustomColors.subRed,
                                CustomColors.softRed,
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
                          "Cancelar",
                          style: TextStyle(color: CustomColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
