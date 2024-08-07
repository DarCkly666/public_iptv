import 'package:flutter/services.dart';
import 'package:public_iptv/src/models/language.dart';

class ServiceLanguage {
  static Future<List<Language>> getLanguages() async {
    String response = await rootBundle.loadString('assets/data/languages.json');
    List<Language> languages = languageFromJson(response);
    return languages;
  }
}
