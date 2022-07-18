import 'package:flutter/material.dart';
import 'package:licencias/models/category.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/category_icon.dart';

class CategoryCard extends StatelessWidget {
  Category category;
  Function onCardClick;

  CategoryCard({Key? key, required this.category, required this.onCardClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/' + this.category.imgName + '.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      CustomColors.black!.withOpacity(0.7),
                      CustomColors.black!.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CategoryIcon(
                      color: category.color,
                      icon: category.icon,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.category.name,
                      style: TextStyle(
                          color: CustomColors.white,
                          fontSize: Fonts.biggestFontSize),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
