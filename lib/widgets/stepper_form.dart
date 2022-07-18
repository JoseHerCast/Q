import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:licencias/screens/await_screen.dart';
import 'package:licencias/screens/signup_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/simple_form_input.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../screens/home_screen.dart';
import 'mini_maps_location.dart';

enum BusinessNameOptions { moral, fisica }
enum CurpRFCOptions { Curp, RFC }
enum DictamenOptions { A, B, C }
enum FactibilityOptions { A, B, C }

class StepperForm extends StatefulWidget {
  StepperForm({Key? key}) : super(key: key);

  @override
  State<StepperForm> createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {
  int _currentStep = 0;
  String requestLifeCurrentValue = "1 año";
  String requestTypeCurrentValue = "Modificación";
  String requestFieldCurrentValue = "Habitacional";
  String requestFactibilityCurrentValue = "Nuevo ingreso";
  String factibilityTypeCurrentValue = "Comercial";
  final vigenciaOptions = [
    "1 año",
    "2 años",
    "3 años",
  ];
  final solicitudDictamenOptions = [
    "Modificación",
    "Ratificación",
    "Regularización",
    "Ampliación",
    "Nuevo",
  ];
  final solicitudFactibilidadOptions = [
    "Nuevo ingreso",
    "Modificación",
    "Renovación",
    "Revisión",
  ];
  final factibilidadTipoOptions = [
    "Comercial",
    "Servicios",
    "Industrial",
    "Microindustrial",
  ];
  final sueloOptions = [
    "Habitacional",
    "Comercial",
    "Servicios",
    "Industrial",
  ];

  var maskPropertyId = new MaskTextInputFormatter(
    mask: '## ## ### ## ### ###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  var rfcMaskFormatter = new MaskTextInputFormatter(
    mask: '#############',
    filter: {"#": RegExp(r'[0-9][a-z][A-Z]')},
    type: MaskAutoCompletionType.lazy,
  );
  var curpMaskFormatter = new MaskTextInputFormatter(
    mask: '##################',
    filter: {"#": RegExp(r'[0-9][a-z][A-Z]')},
    type: MaskAutoCompletionType.lazy,
  );
  var phoneMaskFormatter = new MaskTextInputFormatter(
    mask: '## #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  BusinessNameOptions _userBusinessNameSelected = BusinessNameOptions.fisica;
  BusinessNameOptions _ownerBusinessNameSelected = BusinessNameOptions.fisica;
  CurpRFCOptions _curpOrRFCSelected = CurpRFCOptions.Curp;
  DictamenOptions _dictamenSelected = DictamenOptions.A;

  final userName = TextEditingController();
  final userLNP = TextEditingController();
  final userLNM = TextEditingController();
  final userMail = TextEditingController();
  final userBusinessName = TextEditingController();
  final userPhone = TextEditingController();
  final propertyId = TextEditingController();
  final businessClass = TextEditingController();
  final addressStreet = TextEditingController();
  final addressessExtNum = TextEditingController();
  final addressChar = TextEditingController();
  final addressIntNum = TextEditingController();
  final addressCol = TextEditingController();
  final addressMun = TextEditingController();
  final addressBetween = TextEditingController();
  final addressCP = TextEditingController();
  final curp = TextEditingController();
  final rfc = TextEditingController();
  final businessPhone = TextEditingController();
  final ownerName = TextEditingController();
  final ownerLNP = TextEditingController();
  final ownerLNM = TextEditingController();
  final ownerMail = TextEditingController();
  final ownerBusinessName = TextEditingController();
  final ownerPhone = TextEditingController();
  final dictamenNumber = TextEditingController();
  final terrainSuface = TextEditingController();
  final fieldQuantity = TextEditingController();
  final fieldDescription = TextEditingController();
  final factibilityNumber = TextEditingController();
  final businessSurface = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (BuildContext context, ControlsDetails details) => Row(
        children: [
          TextButton(
            onPressed: details.onStepContinue,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
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
                _currentStep == getSteps().length - 1
                    ? "Enviar solicitud"
                    : "Continuar",
                style: TextStyle(color: CustomColors.white),
              ),
            ),
          ),
          TextButton(
            onPressed: details.onStepCancel,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [CustomColors.subRed, CustomColors.softRed],
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
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              child: Text(
                "Cancelar",
                style: TextStyle(color: CustomColors.white),
              ),
            ),
          ),
        ],
      ),
      physics: ClampingScrollPhysics(),
      type: StepperType.vertical,
      steps: getSteps(),
      currentStep: _currentStep,
      onStepContinue: () {
        final isLastStep = _currentStep == getSteps().length - 1;
        if (isLastStep) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AwaitScreen(),
            ),
          );
        } else {
          setState(() {
            _currentStep = _currentStep > getSteps().length - 1
                ? _currentStep
                : _currentStep + 1;
          });
        }
      },
      onStepCancel: () {
        final isFirstStep = _currentStep == 0;
        if (isFirstStep) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ),
          );
        } else {
          setState(() {
            _currentStep = _currentStep <= 0 ? 0 : _currentStep - 1;
          });
        }
      },
      onStepTapped: (index) {
        setState(() {
          _currentStep = index;
        });
      },
    );
  }

  List<Step> getSteps() => [
        /* Datos del solicitante */
        Step(
          isActive: _currentStep >= 0,
          title: Text("Datos del/de la solicitante"),
          content: Column(
            children: [
              FormSimpleInput(
                controller: userName,
                hintText: "Nombre(s)",
              ),
              FormSimpleInput(
                controller: userLNP,
                hintText: "Apellido Paterno",
              ),
              FormSimpleInput(
                controller: userLNM,
                hintText: "Apellido Materno",
              ),
              /* FormSimpleInput(
                controller: userMail,
                hintText: "Correo electrónico",
              ), */
              FormSimpleInput(
                textFormatter: phoneMaskFormatter,
                hasFormat: true,
                textInputType: TextInputType.number,
                controller: userPhone,
                hintText: "Número de teléfono",
              ),
              /* Dropdown*/
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Solicitud de vigencia"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: DropdownButton(
                  items: vigenciaOptions
                      .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                      .toList(),
                  value: requestLifeCurrentValue,
                  onChanged: (String? selection) {
                    setState(() {
                      requestLifeCurrentValue = selection!;
                    });
                  },
                  isExpanded: true,
                  icon: Icon(LineIcons.caretDown),
                ),
              ),
              /* Checkboxes */
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: BusinessNameOptions.fisica,
                              groupValue: _userBusinessNameSelected,
                              onChanged: (BusinessNameOptions? selection) {
                                setState(() {
                                  _userBusinessNameSelected = selection!;
                                });
                              },
                            ),
                            Text("Física"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: BusinessNameOptions.moral,
                              groupValue: _userBusinessNameSelected,
                              onChanged: (BusinessNameOptions? selection) {
                                setState(() {
                                  _userBusinessNameSelected = selection!;
                                });
                              },
                            ),
                            Text("Moral"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              /* Conditional visibility for Business Name */
              Visibility(
                visible: _userBusinessNameSelected == BusinessNameOptions.moral,
                child: FormSimpleInput(
                  controller: userBusinessName,
                  hintText: "Razón Social",
                ),
              ),
            ],
          ),
        ),
        /* Datos del establecimiento */
        Step(
          isActive: _currentStep >= 1,
          title: Text("Datos del establecimiento"),
          content: Column(
            children: [
              FormSimpleInput(
                textFormatter: maskPropertyId,
                hasFormat: true,
                textInputType: TextInputType.number,
                controller: propertyId,
                hintText: "Clave Catastral del Predio",
              ),
              FormSimpleInput(
                controller: businessClass,
                hintText: "Denominación Comercial",
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Domicilio:"),
              ),
              FormSimpleInput(
                controller: addressStreet,
                hintText: "Calle",
              ),
              FormSimpleInput(
                controller: addressessExtNum,
                hintText: "No. ext.",
              ),
              FormSimpleInput(
                controller: addressChar,
                hintText: "Letra",
              ),
              FormSimpleInput(
                controller: addressIntNum,
                hintText: "No. int.",
              ),
              FormSimpleInput(
                controller: addressCol,
                hintText: "Colonia",
              ),
              FormSimpleInput(
                controller: addressMun,
                hintText: "Municipio",
              ),
              FormSimpleInput(
                controller: addressBetween,
                hintText: "Entre calles",
              ),
              FormSimpleInput(
                controller: addressCP,
                hintText: "C.P.",
              ),
              FormSimpleInput(
                textFormatter: phoneMaskFormatter,
                hasFormat: true,
                textInputType: TextInputType.number,
                controller: businessPhone,
                hintText: "Teléfono",
              ),
              /* Checkboxes */
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: CurpRFCOptions.Curp,
                              groupValue: _curpOrRFCSelected,
                              onChanged: (CurpRFCOptions? selection) {
                                setState(() {
                                  _curpOrRFCSelected = selection!;
                                });
                              },
                            ),
                            Text("CURP"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: CurpRFCOptions.RFC,
                              groupValue: _curpOrRFCSelected,
                              onChanged: (CurpRFCOptions? selection) {
                                setState(() {
                                  _curpOrRFCSelected = selection!;
                                });
                              },
                            ),
                            Text("RFC"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              /* Conditional visibility for Business Name */
              Visibility(
                visible: _curpOrRFCSelected == CurpRFCOptions.Curp,
                child: FormSimpleInput(
                  textFormatter: curpMaskFormatter,
                  hasFormat: true,
                  controller: curp,
                  hintText: "CURP",
                ),
              ),
              Visibility(
                visible: _curpOrRFCSelected == CurpRFCOptions.RFC,
                child: FormSimpleInput(
                  textFormatter: rfcMaskFormatter,
                  hasFormat: true,
                  controller: rfc,
                  hintText: "RFC",
                ),
              ),
            ],
          ),
        ),
        /* Datos del uso de suelo */
        Step(
          isActive: _currentStep >= 2,
          title: Text("Información del dictamen de uso de suelo"),
          content: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Datos del/de la propietario/a del predio"),
              ),
              /* Checkboxes */
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: BusinessNameOptions.fisica,
                              groupValue: _ownerBusinessNameSelected,
                              onChanged: (BusinessNameOptions? selection) {
                                setState(() {
                                  _ownerBusinessNameSelected = selection!;
                                });
                              },
                            ),
                            Text("Física"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: BusinessNameOptions.moral,
                              groupValue: _ownerBusinessNameSelected,
                              onChanged: (BusinessNameOptions? selection) {
                                setState(() {
                                  _ownerBusinessNameSelected = selection!;
                                });
                              },
                            ),
                            Text("Moral"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              /* Conditional visibility for Business Name fisica */
              Visibility(
                visible:
                    _ownerBusinessNameSelected == BusinessNameOptions.fisica,
                child: FormSimpleInput(
                  controller: ownerName,
                  hintText: "Nombre(s)",
                ),
              ),
              Visibility(
                visible:
                    _ownerBusinessNameSelected == BusinessNameOptions.fisica,
                child: FormSimpleInput(
                  controller: ownerLNP,
                  hintText: "Apellido Paterno",
                ),
              ),
              Visibility(
                visible:
                    _ownerBusinessNameSelected == BusinessNameOptions.fisica,
                child: FormSimpleInput(
                  controller: ownerLNM,
                  hintText: "Apellido Materno",
                ),
              ),
              /* Conditional visibility for Business Name Moral*/
              Visibility(
                visible:
                    _ownerBusinessNameSelected == BusinessNameOptions.moral,
                child: FormSimpleInput(
                  controller: userBusinessName,
                  hintText: "Razón Social",
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Tipo de dictamen:"),
              ),
              /* Checkboxes Tipo de dictamen*/
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: DictamenOptions.A,
                              groupValue: _dictamenSelected,
                              onChanged: (DictamenOptions? selection) {
                                setState(() {
                                  _dictamenSelected = selection!;
                                });
                              },
                            ),
                            Text("A"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: DictamenOptions.B,
                              groupValue: _dictamenSelected,
                              onChanged: (DictamenOptions? selection) {
                                setState(() {
                                  _dictamenSelected = selection!;
                                });
                              },
                            ),
                            Text("B"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: DictamenOptions.C,
                              groupValue: _dictamenSelected,
                              onChanged: (DictamenOptions? selection) {
                                setState(() {
                                  _dictamenSelected = selection!;
                                });
                              },
                            ),
                            Text("C"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              /* Dropdown*/
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Tipo de solicitud:"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: DropdownButton(
                  items: solicitudDictamenOptions
                      .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                      .toList(),
                  value: requestTypeCurrentValue,
                  onChanged: (String? selection) {
                    setState(() {
                      requestTypeCurrentValue = selection!;
                    });
                  },
                  isExpanded: true,
                  icon: Icon(LineIcons.caretDown),
                ),
              ),
              FormSimpleInput(
                textInputType: TextInputType.number,
                controller: dictamenNumber,
                hintText: "No. de Dictamen",
              ),
              FormSimpleInput(
                textInputType: TextInputType.number,
                controller: terrainSuface,
                hintText: "Superificie del terreno [m²]",
              ),
              /* Dropdown*/
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Uso de suelo solicitado:"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: DropdownButton(
                  items: sueloOptions
                      .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                      .toList(),
                  value: requestFieldCurrentValue,
                  onChanged: (String? selection) {
                    setState(() {
                      requestFieldCurrentValue = selection!;
                    });
                  },
                  isExpanded: true,
                  icon: Icon(LineIcons.caretDown),
                ),
              ),
              FormSimpleInput(
                textInputType: TextInputType.number,
                controller: fieldQuantity,
                hintText: "Cantidad",
              ),
              FormSimpleInput(
                textMultiline: true,
                controller: fieldDescription,
                hintText: "Descripción",
              ),
            ],
          ),
        ),
        /* Información de la factibilidad de giro*/
        Step(
          isActive: _currentStep >= 3,
          title: Text("Información de la factibilidad de giro"),
          content: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Tipo de factibilidad de giro:"),
              ),
              /* Checkboxes Tipo de dictamen*/
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: DictamenOptions.A,
                              groupValue: _dictamenSelected,
                              onChanged: (DictamenOptions? selection) {
                                setState(() {
                                  _dictamenSelected = selection!;
                                });
                              },
                            ),
                            Text("A"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: DictamenOptions.B,
                              groupValue: _dictamenSelected,
                              onChanged: (DictamenOptions? selection) {
                                setState(() {
                                  _dictamenSelected = selection!;
                                });
                              },
                            ),
                            Text("B"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: DictamenOptions.C,
                              groupValue: _dictamenSelected,
                              onChanged: (DictamenOptions? selection) {
                                setState(() {
                                  _dictamenSelected = selection!;
                                });
                              },
                            ),
                            Text("C"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              /* Dropdown*/
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Tipo de solicitud:"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: DropdownButton(
                  items: factibilidadTipoOptions
                      .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                      .toList(),
                  value: factibilityTypeCurrentValue,
                  onChanged: (String? selection) {
                    setState(() {
                      factibilityTypeCurrentValue = selection!;
                    });
                  },
                  isExpanded: true,
                  icon: Icon(LineIcons.caretDown),
                ),
              ),
              /* Dropdown*/
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: Text("Tipo de factibilidad:"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: DropdownButton(
                  items: solicitudFactibilidadOptions
                      .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                      .toList(),
                  value: requestFactibilityCurrentValue,
                  onChanged: (String? selection) {
                    setState(() {
                      requestFactibilityCurrentValue = selection!;
                    });
                  },
                  isExpanded: true,
                  icon: Icon(LineIcons.caretDown),
                ),
              ),
              FormSimpleInput(
                textInputType: TextInputType.number,
                controller: factibilityNumber,
                hintText: "No. de Factibilidad",
              ),
              FormSimpleInput(
                textInputType: TextInputType.number,
                controller: businessSurface,
                hintText: "Superificie del local [m²]",
              ),
            ],
          ),
        ),
        /* GeoLocalización */
        Step(
          isActive: _currentStep >= 4,
          title: Text("Geolocalización del negocio"),
          content: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.lightGrey,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: CustomColors.shadowWhite),
              ],
            ),
            child: MiniMapsLocation(),
          ),
        ),
        /* Carga de documentos */
        Step(
          isActive: _currentStep >= 5,
          title: Text("Carga de documentos"),
          content: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      color: CustomColors.clearGrey,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: CustomColors.shadowWhite),
                      ],
                    ),
                    child: Text(
                      "Seleccionar archivos",
                      style: TextStyle(color: CustomColors.black),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text("Ningún archivo seleccionado"),
              ),
            ],
          ),
        ),
      ];
}
