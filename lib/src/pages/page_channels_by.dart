import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/channel_item.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/services/service_channel.dart';

class PageChannelsBy extends StatefulWidget {
  final ChannelOption option;
  final String variant;
  final String title;
  const PageChannelsBy(
      {super.key,
      required this.option,
      required this.title,
      required this.variant});

  @override
  State<PageChannelsBy> createState() => _PageChannelsByState();
}

class _PageChannelsByState extends State<PageChannelsBy> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                controller: _controller,
                interactive: true,
                thickness: 8.0,
                radius: const Radius.circular(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisExtent: 150,
                  ),
                  controller: _controller,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    return ChannelItem(
                      channel: channels[index],
                      channels: channels,
                    );
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
    switch (widget.option) {
      case ChannelOption.channelsByCountry:
        return ServiceChannel.getStreamChannelsByCountry(widget.variant);
      case ChannelOption.channelsByCategory:
        return ServiceChannel.getStreamChannelsByCategory(widget.variant);
      case ChannelOption.channelsByLanguage:
        return ServiceChannel.getStreamChannelsByLanguage(widget.variant);
    }
  }
}
