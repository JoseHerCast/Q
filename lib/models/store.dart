import 'package:licencias/models/category.dart';
import 'package:licencias/models/subcategory.dart';

class Store {
  String name;
  String address;
  String phone;
  String category;
  String subcategory;

  Store({
    required this.name,
    required this.address,
    required this.phone,
    required this.category,
    required this.subcategory,
  });
}
