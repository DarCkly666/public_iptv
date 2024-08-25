// To parse this JSON data, do
//
//     final stream = streamFromJson(jsonString);

import 'dart:convert';

List<Stream> streamFromJson(String str) =>
    List<Stream>.from(json.decode(str).map((x) => Stream.fromJson(x)));

String streamToJson(List<Stream> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stream {
  String channel;
  String url;
  String? timeshift;
  String? httpReferrer;
  String? userAgent;

  Stream({
    required this.channel,
    required this.url,
    required this.timeshift,
    required this.httpReferrer,
    required this.userAgent,
  });

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
        channel: json["channel"] ?? "Unknown",
        url: json["url"],
        timeshift: json["timeshift"],
        httpReferrer: json["http_referrer"],
        userAgent: json["user_agent"],
      );

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "url": url,
        "timeshift": timeshift,
        "http_referrer": httpReferrer,
        "user_agent": userAgent,
      };
}
