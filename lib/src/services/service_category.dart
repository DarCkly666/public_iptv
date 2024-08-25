import 'package:flutter/services.dart';
import 'package:public_iptv/src/models/category.dart';

class ServiceCategory {
  static Future<List<Category>> getCategories() async {
    String response =
        await rootBundle.loadString('assets/data/categories.json');
    List<Category> categories = categoryFromJson(response);
    return categories;
  }
}
