import 'package:flutter/material.dart';
import 'package:public_iptv/src/components/channel_item.dart';
import 'package:public_iptv/src/components/loading_spinner.dart';
import 'package:public_iptv/src/models/stream_channel.dart';
import 'package:public_iptv/src/services/service_channel.dart';

class PageChannels extends StatefulWidget {
  const PageChannels({super.key});

  @override
  State<PageChannels> createState() => _PageChannelsState();
}

class _PageChannelsState extends State<PageChannels> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _channelController = TextEditingController();
  List<StreamChannel> _channels = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _channelController,
                      enabled: !loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Channel',
                        hintText: 'Channel',
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton.filledTonal(
                    icon: const Icon(Icons.search),
                    onPressed: loading
                        ? null
                        : () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final String channel =
                                _channelController.text.trim();
                            if (channel.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a channel name.'),
                                ),
                              );
                              return;
                            } else if (channel.length < 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please enter at least 3 characters.'),
                                ),
                              );
                              return;
                            } else {
                              setState(() {
                                loading = true;
                                _channels = [];
                              });
                              ServiceChannel.getStreamChannelsByName(channel)
                                  .then((channels) {
                                setState(() {
                                  _channels = channels;
                                  loading = false;
                                });
                              }).catchError((_) {
                                setState(() {
                                  loading = false;
                                });
                              });
                            }
                          },
                  ),
                ],
              )),
        ),
        Expanded(
          child: loading
              ? const Center(child: LoadingSpinner())
              : _channels.isEmpty
                  ? const Center(
                      child: Text('No channels found.'),
                    )
                  : Scrollbar(
                      controller: _controller,
                      interactive: true,
                      thickness: 8.0,
                      radius: const Radius.circular(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          mainAxisExtent: 150.0,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        controller: _controller,
                        itemCount: _channels.length,
                        itemBuilder: (context, index) {
                          return ChannelItem(
                            channel: _channels[index],
                            channels: _channels,
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}
