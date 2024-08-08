import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/pages/page_player.dart';

class ChannelItem extends StatelessWidget {
  final StreamChannel channel;
  final List<StreamChannel> channels;
  const ChannelItem({
    super.key,
    required this.channel,
    required this.channels,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.network(
            channel.logo,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          channel.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          channel.languages.join(', '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PagePlayer(
                  channel: channel,
                  channels: channels,
                ),
              ));
        },
      ),
    );
  }
}
