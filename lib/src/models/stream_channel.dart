// To parse this JSON data, do
//
//     final channel = channelFromJson(jsonString);

import 'dart:convert';

List<StreamChannel> streamChannelFromJson(String str) =>
    List<StreamChannel>.from(
        json.decode(str).map((x) => StreamChannel.fromJson(x)));

String streamChannelToJson(List<StreamChannel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StreamChannel {
  String id;
  String name;
  String url;
  List<String> altNames;
  List<String> owners;
  String country;
  List<String> languages;
  List<String> categories;
  bool isNsfw;
  String? launched;
  String? closed;
  String? replacedBy;
  String? website;
  String logo;

  StreamChannel({
    required this.id,
    required this.name,
    required this.url,
    required this.altNames,
    required this.owners,
    required this.country,
    required this.languages,
    required this.categories,
    required this.isNsfw,
    required this.launched,
    required this.closed,
    required this.replacedBy,
    required this.website,
    required this.logo,
  });

  factory StreamChannel.fromJson(Map<String, dynamic> json) => StreamChannel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        altNames: List<String>.from(json["alt_names"].map((x) => x)),
        owners: List<String>.from(json["owners"].map((x) => x)),
        country: json["country"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        categories: List<String>.from(json["categories"].map((x) => x)),
        isNsfw: json["is_nsfw"],
        launched: json["launched"],
        closed: json["closed"],
        replacedBy: json["replaced_by"],
        website: json["website"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "alt_names": List<dynamic>.from(altNames.map((x) => x)),
        "owners": List<dynamic>.from(owners.map((x) => x)),
        "country": country,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "is_nsfw": isNsfw,
        "launched": launched,
        "closed": closed,
        "replaced_by": replacedBy,
        "website": website,
        "logo": logo,
      };
}
