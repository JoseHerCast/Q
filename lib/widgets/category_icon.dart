import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  Color color;
  Icon icon;

  CategoryIcon({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: this.color,
        padding: EdgeInsets.all(10),
        child: this.icon,
      ),
    );
  }
}
