import 'package:flutter/cupertino.dart';
import 'package:licencias/models/category.dart';
import 'package:licencias/models/subcategory.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:line_icons/line_icons.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        name: 'Carnes',
        icon: Icon(LineIcons.hamburger),
        color: CustomColors.MEATS,
        imgName: 'cat1',
        subCategories: [
          SubCategory(
            name: 'Cerdo y Res',
            icon: Icon(LineIcons.bacon),
            color: CustomColors.MEATS,
            imgName: 'cat1_pork',
          ),
          SubCategory(
            name: 'Pollo',
            icon: Icon(LineIcons.drumstickWithBiteTakenOut),
            color: CustomColors.MEATS,
            imgName: 'cat1_chicken',
          ),
          SubCategory(
            name: 'Pescado',
            icon: Icon(LineIcons.fish),
            color: CustomColors.MEATS,
            imgName: 'cat1_fish',
          ),
          SubCategory(
            name: 'Embutidos',
            icon: Icon(LineIcons.hotDog),
            color: CustomColors.MEATS,
            imgName: 'cat1_sausages',
          )
        ],
      ),
      Category(
        name: 'Frutas y Verduras',
        icon: Icon(LineIcons.apple),
        color: CustomColors.FRUITS,
        imgName: 'cat2',
        subCategories: [
          SubCategory(
            name: 'Frutas',
            icon: Icon(LineIcons.bacon),
            color: CustomColors.FRUITS,
            imgName: 'cat2_fruits',
          ),
          SubCategory(
            name: 'Verduras',
            icon: Icon(LineIcons.drumstickWithBiteTakenOut),
            color: CustomColors.FRUITS,
            imgName: 'cat2_veggies',
          ),
          SubCategory(
            name: 'Semillas',
            icon: Icon(LineIcons.fish),
            color: CustomColors.FRUITS,
            imgName: 'cat2_seeds',
          ),
          SubCategory(
            name: 'Otros',
            icon: Icon(LineIcons.hotDog),
            color: CustomColors.FRUITS,
            imgName: 'cat2_others',
          )
        ],
      ),
      Category(
        name: 'Papelería',
        icon: Icon(LineIcons.pencilRuler),
        color: CustomColors.OFFICE,
        imgName: 'cat3',
        subCategories: [
          SubCategory(
            name: 'Papelería en general',
            icon: Icon(LineIcons.bacon),
            color: CustomColors.OFFICE,
            imgName: 'cat3_school',
          ),
          SubCategory(
            name: 'Oficina',
            icon: Icon(LineIcons.drumstickWithBiteTakenOut),
            color: CustomColors.OFFICE,
            imgName: 'cat3_office',
          ),
          SubCategory(
            name: 'Arte y manualidades',
            icon: Icon(LineIcons.fish),
            color: CustomColors.OFFICE,
            imgName: 'cat3_art',
          ),
          SubCategory(
            name: 'Impresión',
            icon: Icon(LineIcons.hotDog),
            color: CustomColors.OFFICE,
            imgName: 'cat3_printing',
          )
        ],
      ),
      Category(
        name: 'Herramientas',
        icon: Icon(LineIcons.tools),
        color: CustomColors.TOOLS,
        imgName: 'cat4',
        subCategories: [
          SubCategory(
            name: 'Tlapalería',
            icon: Icon(LineIcons.bacon),
            color: CustomColors.TOOLS,
            imgName: 'cat4_tools',
          ),
          SubCategory(
            name: 'Electricidad',
            icon: Icon(LineIcons.drumstickWithBiteTakenOut),
            color: CustomColors.TOOLS,
            imgName: 'cat4_electricity',
          ),
          SubCategory(
            name: 'Electrónica',
            icon: Icon(LineIcons.fish),
            color: CustomColors.TOOLS,
            imgName: 'cat4_electronic',
          ),
          SubCategory(
            name: 'Construcción',
            icon: Icon(LineIcons.hotDog),
            color: CustomColors.TOOLS,
            imgName: 'cat4_building',
          )
        ],
      ),
      Category(
        name: 'Panadería',
        icon: Icon(LineIcons.breadSlice),
        color: CustomColors.PASTRIES,
        imgName: 'cat5',
        subCategories: [
          SubCategory(
            name: 'Panadería en general',
            icon: Icon(LineIcons.fish),
            color: CustomColors.PASTRIES,
            imgName: 'cat5_bakery',
          ),
          SubCategory(
            name: 'Repostería',
            icon: Icon(LineIcons.bacon),
            color: CustomColors.PASTRIES,
            imgName: 'cat5_pastry',
          ),
          SubCategory(
            name: 'Pastelería',
            icon: Icon(LineIcons.drumstickWithBiteTakenOut),
            color: CustomColors.PASTRIES,
            imgName: 'cat5_cake',
          ),
        ],
      ),
    ];
  }
}
