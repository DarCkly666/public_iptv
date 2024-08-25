import 'package:flutter/services.dart';
import 'package:public_iptv/src/models/country.dart';

class ServiceCountry {
  static Future<List<Country>> getCountries() async {
    String response = await rootBundle.loadString('assets/data/countries.json');
    List<Country> countries = countryFromJson(response);
    return countries;
  }
}
