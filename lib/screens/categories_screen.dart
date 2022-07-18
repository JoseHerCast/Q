import 'package:flutter/material.dart';
import 'package:licencias/models/category.dart';
import 'package:licencias/models/utils.dart';
import 'package:licencias/screens/selected_category_screen.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: categories[index],
                  onCardClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedCategoryScreen(
                                selectedCategory: this.categories[index],
                              )),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
