import 'package:flutter/services.dart';
import 'package:public_iptv/src/models/language.dart';

class ServiceLanguage {
  static Future<List<Language>> getLanguages() async {
    String response = await rootBundle.loadString('assets/data/languages.json');
    List<Language> languages = languageFromJson(response);
    return languages;
  }

  static Future<List<Language>> getLanguagesByLetter(String letter) async {
    List<Language> languages = await getLanguages();
    final languageByLetter = languages
        .where((language) => language.name.startsWith(letter))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    return languageByLetter;
  }
}
