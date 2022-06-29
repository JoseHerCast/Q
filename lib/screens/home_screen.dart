import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:licencias/screens/payment_screen.dart';
import 'package:licencias/widgets/nav_pages.dart';
import 'package:line_icons/line_icons.dart';

/// `HomeScreen` is a `StatefulWidget` that has a `title` property and a `createState` method that
/// returns a `_HomeScreenState` object
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// The HomeScreen class is a StatefulWidget class that returns a Scaffold widget with an AppBar widget,
/// a body widget, and a bottom navigation bar widget
class _HomeScreenState extends State<HomeScreen> {
  /// Creating a variable called `_selectedIndex` and setting it to 0.
  int _selectedIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  /// The build function is a function that returns a Scaffold widget with an AppBar widget, a body
  /// widget, and a bottom navigation bar widget
  ///
  /// Args:
  ///   context (BuildContext): The context of the widget.
  ///
  /// Returns:
  ///   A Scaffold widget with an AppBar, a body, and a bottomNavigationBar.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AdvancedDrawer(
        backdropColor: Color(0xff76a6cf),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,

          /// Creating an AppBar widget with a title and a centerTitle property.
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Demo Licenciamiento Queretaro",
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),

          /// Creating a SizedBox widget with a width property that is the width of the screen and a child
          /// property that is a Routes widget with an index property that is the value of the
          /// _selectedIndex variable.
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: NavPages(index: _selectedIndex),
          ),

          /// Creating a bottom navigation bar with 4 buttons.
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,

                  /// Creating a list of GButton widgets.
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Inicio',
                    ),
                    GButton(
                      icon: LineIcons.heart,
                      text: 'Favoritos',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Buscar',
                    ),
                    GButton(
                      icon: LineIcons.tag,
                      text: 'Ofertas',
                    ),
                  ],

                  /// Setting the selectedIndex property of the GNav widget to the value of the
                  /// _selectedIndex variable.
                  selectedIndex: _selectedIndex,

                  /// Setting the value of the _selectedIndex variable to the value of the index variable.
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/Queretaro_Logo.png',
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Perfil'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.shopping_bag,
                    ),
                    title: Text('Mis ofertas'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
                    leading: Icon(Icons.monetization_on),
                    title: Text('Pago de licencia'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.message),
                    title: Text('Mensajes'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.settings),
                    title: Text('Ajustes'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.help),
                    title: Text('Ayuda'),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
