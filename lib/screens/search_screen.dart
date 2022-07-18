// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../styles/global_styles.dart';
import '../widgets/simple_form_input.dart';

const cremeriaDescription =
    "Con mas de 40 años de tradición en la fabricación de productos derivados de la leche, en Cremería El coléga ofrecemos un gran surtido de productos artesanales de alta calidad.\nCremería El coléga elabora sus productos con leche de alto valor nutrimental y cada uno de ellos es procesado con técnicas tradicionales que nos permiten acercar el amor del campo hasta su mesa.";

const carniceriaDescription =
    "Carnicería Lupita es orgullosamente mexicana, dedicada a la producción y comercialización de proteína animal de calidad.\nLlevamos la mejor selección de carnes importadas a tu casa, para tus fiestas, reuniones y parrilladas.";

const panaderiaDescription =
    "Somos una empresa dedicada a la producción y distribución de productos de panadería, pastelería y repostería de alta calidad y sabor; fundada en 2013.\nContamos con una deliciosa gama de pasteles para toda ocasión, panadería y postres. Servicio a domicilio. ¡Deleitando tus sentidos!";

/// `SearchScreen` is a `StatefulWidget` that creates a `_SearchScreenState` object
class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

/// _SearchScreenState is a stateful widget that contains a text field that is used to search for
/// places.
class _SearchScreenState extends State<SearchScreen> {
  /// A controller that is used to control the text field.
  final _searchFieldController = TextEditingController();
  DetailsResult? _selectedPlace;
  late FocusNode placeFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

  void initState() {
    super.initState();
    String apiKey = 'AIzaSyA95A_Ncf4aX1s4Tqg-DPd3T_DyKTDBBg0';
    googlePlace = GooglePlace(apiKey);

    placeFocusNode = FocusNode();
  }

  void dispose() {
    super.dispose();
    placeFocusNode.dispose();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value, language: 'es-419');
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ListView(
              children: [
                Card2(
                  title: 'Cremería "El coléga"',
                  address: 'Los Héroes, Ixtapaluca',
                  description: cremeriaDescription,
                  mainCover:
                      'https://mitiendatx.com/img/cremeria-800x600-3.jpg',
                  imageLT: 'https://mitiendatx.com/img/cremeria-800x600-1.jpg',
                  imageRT:
                      'https://tableagent.s3.amazonaws.com/media/xl/2851_7421.jpg',
                  imageLB:
                      'https://th.bing.com/th/id/R.3e5bf8298f106549a402b7073c1940b9?rik=TRcL7uss3stg6g&riu=http%3a%2f%2fclaustronomia.elclaustro.edu.mx%2fmedia%2fk2%2fitems%2fcache%2f93ba6c299f04f710c35672b0f157402a_XL.jpg&ehk=dta3F8i9DtrZtrBxfOEDwiJwYkH2Xezmb24bZLBtSoM%3d&risl=&pid=ImgRaw&r=0',
                  imageRB: 'https://mitiendatx.com/img/cremeria-800x600-3.jpg',
                  titleQR: "10% de descuento en quesos al mayoreo.",
                  descQR: "Presenta este código para hacer válida la promoción",
                  pathQR: "assets/images/flowcode.png",
                ),
                Card2(
                  title: 'Carnicería "Lupita"',
                  address: 'Fraccionamiento Linda Vista, Chalco',
                  description: carniceriaDescription,
                  mainCover:
                      'https://elinsignia.com/wp-content/uploads/2017/11/carniceria.jpg',
                  imageLT:
                      'https://atnprodstge.blob.core.windows.net/atnassets/2015/12/ico-destinonegocio-carniceria-istock-getty-images-1030x767-1.jpg',
                  imageRT:
                      'https://blog.cofike.com/wp-content/uploads/2020/04/plan-de-negocio-carnicer%C3%ADa.jpg',
                  imageLB:
                      'http://cdn.shopify.com/s/files/1/0469/3193/articles/negocio_carniceria_1200x1200.jpg?v=1582731730',
                  imageRB:
                      'https://elinsignia.com/wp-content/uploads/2017/11/carniceria.jpg',
                  titleQR: "15% de descuento al comprar más de 15 KG de carne",
                  descQR: "Presenta este código para hacer válida la promoción",
                  pathQR: "assets/images/flowcode.png",
                ),
                Card2(
                  title: 'Panaderia Cielo',
                  address: '4 Vientos, Ixtapaluca',
                  description: panaderiaDescription,
                  mainCover:
                      'https://media.timeout.com/images/105618884/image.jpg',
                  imageLT:
                      'https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/inline-images/panadaeria-antiagua-centro-cdmx.jpg',
                  imageRT:
                      'https://media-cdn.tripadvisor.com/media/photo-p/14/17/11/6d/el-pan-de-cinco-y-dos.jpg',
                  imageLB:
                      'https://www.namesnack.com/images/namesnack-bakery-business-names-4568x3401-2020105.jpeg?crop=21:16,smart&width=420&dpr=2',
                  imageRB:
                      'https://media.timeout.com/images/105618884/image.jpg',
                  titleQR: "\$50 de bonificacion por cada \$300",
                  descQR: "Presenta este código para hacer válida la promoción",
                  pathQR: "assets/images/flowcode.png",
                ),
              ],
            ),
          ),
          Column(
            children: [
              FormSimpleInput(
                focusNode: placeFocusNode,
                controller: _searchFieldController,
                hintText: "Buscar lugar",
                suffixIcon: _searchFieldController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            predictions = [];
                            _searchFieldController.clear();
                          });
                        },
                        icon: Icon(
                          LineIcons.times,
                        ),
                      )
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 700),
                    () {
                      if (value.isNotEmpty) {
                        autoCompleteSearch(value);
                      } else {
                        setState(() {
                          predictions = [];
                          _selectedPlace = null;
                        });
                      }
                    },
                  );
                },
              ),
              Container(
                color: CustomColors.white,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          LineIcons.placeOfWorship,
                          color: CustomColors.white,
                        ),
                      ),
                      title: Text(
                        predictions[index].description.toString(),
                      ),
                      onTap: () async {
                        final placeId = predictions[index].placeId!;
                        final details = await googlePlace.details.get(placeId);

                        /// Checking if the details are not null and if the result is not null and if the
                        /// widget is mounted.
                        if (details != null &&
                            details.result != null &&
                            mounted) {
                          if (placeFocusNode.hasFocus) {
                            setState(() {
                              _selectedPlace = details.result;
                              _searchFieldController.text =
                                  details.result!.name!;
                              predictions = [];
                            });
                          }
                          if (_selectedPlace != null) {
                            print('Navigate');
                          }
                        }
                      },
                    );
                  },
                  itemCount: predictions.length,
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  String mainCover;
  String imageLT;
  String imageRT;
  String imageLB;
  String imageRB;
  String title;
  String address;
  String titleQR;
  String descQR;
  String pathQR;
  String description;

  Card2({
    Key? key,
    required this.mainCover,
    required this.imageLT,
    required this.imageLB,
    required this.imageRB,
    required this.imageRT,
    required this.title,
    required this.address,
    required this.titleQR,
    required this.descQR,
    required this.pathQR,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildImg(String urlImage, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.lightBlue,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(
                  urlImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            /* child: Image.network(
              urlImage,
              fit: BoxFit.cover,
            ), */
          ));
    }

    buildCollapsed1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ]);
    }

    buildCollapsed2() {
      return buildImg(mainCover, 150);
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: buildImg(imageLT, 100)),
              Expanded(child: buildImg(imageRT, 100)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: buildImg(imageLB, 100)),
              Expanded(child: buildImg(imageRB, 100)),
            ],
          ),
        ],
      );
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              softWrap: true,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Teléfono: 555 555 55 55'),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: buildCollapsed1(),
                expanded: buildExpanded1(),
              ),
              Expandable(
                collapsed: buildCollapsed2(),
                expanded: buildExpanded2(),
              ),
              Expandable(
                collapsed: buildCollapsed3(),
                expanded: buildExpanded3(),
              ),
              Divider(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true)!;
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                        ),
                        child: TextButton(
                          child: Text(
                            controller.expanded ? "Ocultar" : "Mostrar",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: CustomColors.lightBlue),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true)!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextButton(
                          child: Text(
                            controller.expanded ? "Código promocional" : "",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: CustomColors.lightBlue),
                          ),
                          onPressed: () {
                            _showQRCode(context, titleQR, descQR, pathQR);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  _showQRCode(context, title, desc, img) {
    Alert(
      context: context,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          gradient: LinearGradient(
              colors: [CustomColors.subBlue, CustomColors.softBlue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          radius: BorderRadius.circular(50),
          color: CustomColors.lightGrey,
          child: Text(
            "Cerrar",
            style: TextStyle(color: CustomColors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        DialogButton(
          gradient: LinearGradient(
              colors: [CustomColors.subGreen, CustomColors.softGreen],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          radius: BorderRadius.circular(50),
          child: Text(
            "Guardar",
            style: TextStyle(color: CustomColors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            showTopSnackBar(
              context,
              CustomSnackBar.success(
                backgroundColor: CustomColors.softGreen,
                message: "Promoción guardada correctamente. ¡Sigue así!",
              ),
            );
          },
        )
      ],
      alertAnimation: fadeAlertAnimation,
      image: Image.asset(img),
    ).show();
  }

  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
