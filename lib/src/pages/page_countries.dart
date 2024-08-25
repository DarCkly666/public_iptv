import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/country_item.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/country.dart';
import 'package:public_iptv/src/services/service_country.dart';

class PageCountries extends StatefulWidget {
  const PageCountries({super.key});

  @override
  State<PageCountries> createState() => _PageCountriesState();
}

class _PageCountriesState extends State<PageCountries> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceCountry.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final countries = snapshot.data as List<Country>;
            return Scrollbar(
              controller: _controller,
              interactive: true,
              thickness: 8.0,
              radius: const Radius.circular(8.0),
              child: GridView.builder(
                controller: _controller,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return CountryItem(
                    country: countries[index],
                    channelOption: ChannelOption.channelsByCountry,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
