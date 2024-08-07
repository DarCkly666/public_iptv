import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/country.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';
import 'package:public_iptv/src/services/service_country.dart';

class PageCountries extends StatelessWidget {
  const PageCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceCountry.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final countries = snapshot.data as List<Country>;
            return Scrollbar(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text(countries[index].flag,
                          style: const TextStyle(fontSize: 24)),
                      title: Text(
                          '${countries[index].name} (${countries[index].code})'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageChannelsBy(
                                      option: ChannelOption.channelsByCountry,
                                      title: countries[index].name,
                                      variant: countries[index].code,
                                    )));
                      },
                    ),
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
