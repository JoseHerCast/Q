import 'package:flutter/material.dart';
import 'package:licencias/models/category.dart';

class SubCategory extends Category {
  SubCategory({
    required String name,
    required Icon icon,
    required Color color,
    required String imgName,
  }) : super(
          name: name,
          icon: icon,
          color: color,
          imgName: imgName,
        );
}
