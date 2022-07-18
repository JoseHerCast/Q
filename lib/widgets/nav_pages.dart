import 'package:flutter/material.dart';
import 'package:licencias/screens/favs_screen.dart';
import 'package:licencias/screens/map_screen.dart';
import 'package:licencias/screens/categories_screen.dart';
import 'package:licencias/screens/search_screen.dart';

/// It returns a list of widgets, which are the screens of the app
class NavPages extends StatelessWidget {
  /// A variable that is used to know which screen is going to be shown.
  final int index;

  const NavPages({Key? key, required this.index}) : super(key: key);

  /// It returns a list of widgets, which are the screens of the app
  ///
  /// Args:
  ///   context (BuildContext): The current context of the application.
  ///
  /// Returns:
  ///   A list of widgets.
  @override
  Widget build(BuildContext context) {
    /// Creating a list of widgets.
    List<Widget> _myPages = [
      MapScreen(),
      //FavsScreen(),
      SearchScreen(),
      CategoriesScreen()
    ];
    return _myPages[index];
  }
}
