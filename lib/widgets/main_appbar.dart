import 'package:flutter/material.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:line_icons/line_icons.dart';

class MainAppbar extends StatefulWidget implements PreferredSizeWidget {
  String title;

  MainAppbar({Key? key, required this.title}) : super(key: key);

  @override
  State<MainAppbar> createState() => _MainAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(60);
}

class _MainAppbarState extends State<MainAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.lightBlue, CustomColors.clearBlue],
            begin: Alignment.centerLeft,
            end: Alignment(4, 0.5),
          ),
        ),
      ),
      elevation: 0,
      leading: IconButton(
        icon: Icon(LineIcons.angleLeft, size: 28, color: CustomColors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: CustomColors.lightBlue,
      title: Text(
        widget.title, //with this line we can customize our AppBar Title
        style: TextStyle(color: CustomColors.white),
      ),
      centerTitle: true,
    );
  }
}
