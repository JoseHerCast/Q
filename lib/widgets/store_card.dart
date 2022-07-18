import 'package:flutter/material.dart';
import 'package:licencias/models/category.dart';
import 'package:licencias/models/store.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/category_icon.dart';
import 'package:line_icons/line_icons.dart';

class StoreCard extends StatelessWidget {
  Store store;
  Color categoryColor;

  StoreCard({Key? key, required this.store, required this.categoryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 160,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(color: CustomColors.lightGrey!),
            ),
          ),
          Positioned(
            bottom: 0,
            top: 0,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: CustomColors.softBlue,
                      child: Icon(
                        LineIcons.alternateStore,
                        color: CustomColors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 120,
            child: Text(
              this.store.name,
              style: TextStyle(
                  color: CustomColors.black, fontSize: Fonts.bigFontSize),
            ),
          ),
          Positioned(
            left: 110,
            top: 60,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 240,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      this.store.address,
                      style: TextStyle(
                          color: CustomColors.black,
                          fontSize: Fonts.smallFontSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 120,
            child: Text(
              'Teléfono: ' + this.store.phone,
              style: TextStyle(
                  color: CustomColors.black, fontSize: Fonts.smallFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
