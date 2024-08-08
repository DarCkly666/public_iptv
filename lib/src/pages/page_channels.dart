import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/channel_item.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/services/service_channel.dart';

class PageChannels extends StatefulWidget {
  const PageChannels({super.key});

  @override
  State<PageChannels> createState() => _PageChannelsState();
}

class _PageChannelsState extends State<PageChannels> {
  final ScrollController _semicircleController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceChannel.getStreamChannels(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final channels = snapshot.data as List<StreamChannel>;
            return DraggableScrollbar.semicircle(
              controller: _semicircleController,
              labelTextBuilder: (offset) {
                final int currentItem = _semicircleController.hasClients
                    ? (_semicircleController.offset /
                            _semicircleController.position.maxScrollExtent *
                            channels.length)
                        .floor()
                    : 0;

                return Text(
                  channels[currentItem].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              labelConstraints:
                  const BoxConstraints.tightFor(width: 150.0, height: 30.0),
              child: ListView.builder(
                controller: _semicircleController,
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
