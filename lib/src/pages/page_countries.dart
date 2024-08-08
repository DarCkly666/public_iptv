import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/country.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';
import 'package:public_iptv/src/services/service_country.dart';

class PageCountries extends StatefulWidget {
  const PageCountries({super.key});

  @override
  State<PageCountries> createState() => _PageCountriesState();
}

class _PageCountriesState extends State<PageCountries> {
  final ScrollController _semicircleController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceCountry.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final countries = snapshot.data as List<Country>;
            return DraggableScrollbar.semicircle(
              controller: _semicircleController,
              labelTextBuilder: (offset) {
                final int currentItem = _semicircleController.hasClients
                    ? (_semicircleController.offset /
                            _semicircleController.position.maxScrollExtent *
                            countries.length)
                        .floor()
                    : 0;

                return Text(
                  countries[currentItem].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              labelConstraints:
                  const BoxConstraints.tightFor(width: 150.0, height: 30.0),
              child: ListView.builder(
                controller: _semicircleController,
                padding: const EdgeInsets.all(8.0),
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
