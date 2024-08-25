import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/country.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';

class CountryItem extends StatelessWidget {
  final Country country;
  final ChannelOption channelOption;
  const CountryItem(
      {super.key, required this.country, required this.channelOption});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageChannelsBy(
              option: channelOption,
              title: country.name,
              variant: country.code,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(country.flag,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 32)),
          Text(
            country.name,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
