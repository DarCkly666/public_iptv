import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/channel_item.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/services/service_channel.dart';

class PageChannelsBy extends StatelessWidget {
  final ChannelOption option;
  final String variant;
  final String title;
  const PageChannelsBy(
      {super.key,
      required this.option,
      required this.title,
      required this.variant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        forceMaterialTransparency: true,
      ),
      body: FutureBuilder(
          future: _getChannels(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final channels = snapshot.data as List<StreamChannel>;
              if (channels.isEmpty) {
                return const Center(child: Text('No channels'));
              }
              return Scrollbar(
                interactive: true,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    return ChannelItem(channel: channels[index]);
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List<StreamChannel>> _getChannels() async {
    switch (option) {
      case ChannelOption.channelsByCountry:
        return ServiceChannel.getStreamChannelsByCountry(variant);
      case ChannelOption.channelsByCategory:
        return ServiceChannel.getStreamChannelsByCategory(variant);
      case ChannelOption.channelsByLanguage:
        return ServiceChannel.getStreamChannelsByLanguage(variant);
    }
  }
}
