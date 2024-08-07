import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/pages/page_player.dart';

class ChannelItem extends StatelessWidget {
  final StreamChannel channel;
  const ChannelItem({
    super.key,
    required this.channel,
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
          channel.categories.join(', '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PagePlayer(
                  channel: channel,
                ),
              ));
        },
      ),
    );
  }
}
