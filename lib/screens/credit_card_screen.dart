import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:licencias/controllers/payment_controller.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/simple_form_input.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:math' as math;

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreditCardScreen extends StatefulWidget {
  CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  var maskPropertyCardNumber = new MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  var maskPropertyExpiryDate = new MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  var maskPropertyCVV = new MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  String cardNumber = '';
  String bankName = 'Banco';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;

  final cardNumberCtrl = TextEditingController();
  final expiryFieldCtrl = TextEditingController();
  final cardHolderCtrl = TextEditingController();
  final cvvCtrl = TextEditingController();

  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
            "Agregar tarjeta",
            style: TextStyle(color: CustomColors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                CreditCard(
                  textExpDate: 'Vigencia',
                  textExpiry: 'MM/AA',
                  textName: 'Nombre del titular',
                  cardNumber: cardNumber,
                  cardExpiry: expiryDate,
                  cardHolderName: cardHolderName,
                  cvv: cvv,
                  bankName: bankName,
                  showBackSide: showBack,
                  frontBackground: CardBackgrounds.black,
                  backBackground: CardBackgrounds.white,
                  showShadow: true,
                  // mask: getCardTypeMask(cardType: CardType.americanExpress),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        /* Form here */
                        FormSimpleInput(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: CustomColors.lightBlue, width: 1.5),
                            ),
                          ),
                          textInputType: TextInputType.number,
                          hasFormat: true,
                          textFormatter: maskPropertyCardNumber,
                          controller: cardNumberCtrl,
                          hintText: "Número de tarjeta",
                          onChanged: (value) {
                            final newCardNumber = value.trim();
                            var newStr = '';
                            final step = 4;

                            for (var i = 0;
                                i < newCardNumber.length;
                                i += step) {
                              newStr += newCardNumber.substring(
                                  i, math.min(i + step, newCardNumber.length));
                            }

                            setState(() {
                              cardNumber = newStr;
                            });
                          },
                        ),
                        FormSimpleInput(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: CustomColors.lightBlue, width: 1.5),
                            ),
                          ),
                          textInputType: TextInputType.number,
                          hasFormat: true,
                          textFormatter: maskPropertyExpiryDate,
                          controller: expiryFieldCtrl,
                          hintText: "Vigencia",
                          onChanged: (value) {
                            var newDateValue = value.trim();
                            final isPressingBackspace =
                                expiryDate.length > newDateValue.length;
                            final containsSlash = newDateValue.contains('/');

                            if (newDateValue.length >= 2 &&
                                !containsSlash &&
                                !isPressingBackspace) {
                              newDateValue = newDateValue.substring(0, 2) +
                                  '/' +
                                  newDateValue.substring(2);
                            }
                            setState(() {
                              expiryFieldCtrl.text = newDateValue;
                              expiryFieldCtrl.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: newDateValue.length));
                              expiryDate = newDateValue;
                            });
                          },
                        ),
                        FormSimpleInput(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: CustomColors.lightBlue, width: 1.5),
                            ),
                          ),
                          textInputType: TextInputType.name,
                          controller: cardHolderCtrl,
                          hintText: "Nombre del titular",
                          onChanged: (value) {
                            setState(() {
                              cardHolderName = value;
                            });
                          },
                        ),
                        FormSimpleInput(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: CustomColors.lightBlue, width: 1.5),
                            ),
                          ),
                          textInputType: TextInputType.number,
                          hasFormat: true,
                          textFormatter: maskPropertyCVV,
                          controller: cvvCtrl,
                          hintText: "CVV",
                          onChanged: (value) {
                            setState(() {
                              cvv = value;
                            });
                          },
                          focusNode: _focusNode,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 30),
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
                              "Añadir",
                              style: TextStyle(color: CustomColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
