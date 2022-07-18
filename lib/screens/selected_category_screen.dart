import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:licencias/models/category.dart';
import 'package:licencias/screens/store_list_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/category_icon.dart';
import 'package:licencias/widgets/main_appbar.dart';
import 'package:line_icons/line_icons.dart';

class SelectedCategoryScreen extends StatelessWidget {
  Category selectedCategory;

  SelectedCategoryScreen({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: 'Subcategorias',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  color: this.selectedCategory.color,
                  icon: this.selectedCategory.icon,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  this.selectedCategory.name,
                  style: TextStyle(
                    color: this.selectedCategory.color,
                    fontSize: Fonts.mediumFontSize,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Expanded(
                child: GridView.count(
              mainAxisSpacing: 60,
              crossAxisCount: 2,
              children: List.generate(
                this.selectedCategory.subCategories!.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreListScreen(
                          categoryColor: this.selectedCategory.color,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: CustomColors.white,
                            child: Image.asset(
                              'assets/images/' +
                                  this
                                      .selectedCategory
                                      .subCategories![index]
                                      .imgName +
                                  '.png',
                              fit: BoxFit.contain,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        Text(
                          this.selectedCategory.subCategories![index].name,
                          style: TextStyle(
                            fontSize: Fonts.smallFontSize,
                            color: this
                                .selectedCategory
                                .subCategories![index]
                                .color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
