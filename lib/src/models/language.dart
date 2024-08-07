// To parse this JSON data, do
//
//     final language = languageFromJson(jsonString);

import 'dart:convert';

List<Language> languageFromJson(String str) =>
    List<Language>.from(json.decode(str).map((x) => Language.fromJson(x)));

String languageToJson(List<Language> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Language {
  String name;
  String code;

  Language({
    required this.name,
    required this.code,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
