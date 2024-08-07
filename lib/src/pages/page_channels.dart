import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/channel_item.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/services/service_channel.dart';

class PageChannels extends StatelessWidget {
  const PageChannels({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceChannel.getStreamChannels(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final channels = snapshot.data as List<StreamChannel>;
            return Scrollbar(
              child: ListView.builder(
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
        });
  }
}
