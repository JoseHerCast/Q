import 'package:flutter/material.dart';
import 'package:licencias/screens/home_screen.dart';
import 'package:licencias/screens/select_card_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/main_appbar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: MainAppbar(title: 'Elige un método de pago'),
        body: ListView(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    height: 100,
                    /* decoration: BoxDecoration(
                      color: CustomColors.white,
                    ), */
                    child: Text(
                      "Monto a pagar",
                      style: TextStyle(
                        color: CustomColors.black!.withOpacity(0.5),
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    /* decoration: BoxDecoration(
                      color: CustomColors.white,
                    ), */
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: LineIcon(
                              LineIcons.dollarSign,
                              size: 60,
                              color: CustomColors.black,
                            ),
                          ),
                          Container(
                            child: Text(
                              "1,299 MXN",
                              style: TextStyle(
                                color: CustomColors.black,
                                fontSize: 52,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    /* decoration: BoxDecoration(
                      color: CustomColors.white,
                    ), */
                    child: Text(
                      "*Costo anual del licenciamiento. Todos los precios incluyen IVA.",
                      style: TextStyle(
                        color: CustomColors.black!.withOpacity(0.3),
                        fontSize: Fonts.smallFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectCardScreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 60),
                      height: 100,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: LineIcon(
                                LineIcons.creditCard,
                                size: 48,
                                color: CustomColors.subBlue,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Tarjeta de Débito/Crédito",
                                style: TextStyle(
                                  color: CustomColors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 350,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          decoration: BoxDecoration(
                              color: CustomColors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/spei.png",
                                    width: 140,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "CLABE",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("621458796523145678"),
                              Text(
                                "Datos del beneficiario",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Nombre: Beneficiario"),
                              Text("Tipo de cuenta: CLABE"),
                              Text(
                                "Banco receptor/destinatario",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("STP (Sistema de Transferencias y Pagos)"),
                              Text("Concepto: Pago"),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 100,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              margin: EdgeInsets.only(right: 30),
                              child: Image.asset("assets/images/spei.png"),
                            ),
                            Container(
                              child: Text(
                                "Transferencia Bancaria",
                                style: TextStyle(
                                  color: CustomColors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 350,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          decoration: BoxDecoration(
                              color: CustomColors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineIcons.alternateMapMarked,
                                    size: 80,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Puedes realizar tu pago en:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Blvd. Bulevar 11111"),
                              Text("Col. Colonia"),
                              Text("Municipio, Estado"),
                              Text("C.P. 55555"),
                              Text("Horario: Lunes a Viernes 8:00 a 19:00 hrs"),
                              Text("Teléfono: 01(555) 555 55 55"),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 100,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: LineIcon(
                                LineIcons.moneyBill,
                                size: 48,
                                color: CustomColors.softGreen,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Efectivo en puntos de pago",
                                style: TextStyle(
                                  color: CustomColors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
