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
                    child: TextFormField(
                      controller: _channelController,
                      enabled: !loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Channel',
                        hintText: 'Channel',
                        helperText: 'Enter a channel name',
                        prefixIcon: const Icon(Icons.search),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().isEmpty) {
                          return 'Please enter a channel name';
                        }
                        if (value.length < 3) {
                          return 'Please enter at least 3 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton.outlined(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        final String channel = _channelController.text.trim();
                        final List<StreamChannel> channels =
                            await ServiceChannel.getStreamChannelsByName(
                                channel);
                        setState(() {
                          _channels = channels;
                          loading = false;
                        });
                      }
                    },
                  ),
                ],
              )),
        ),
        Expanded(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Scrollbar(
                  controller: _controller,
                  interactive: true,
                  thickness: 8.0,
                  radius: const Radius.circular(8.0),
                  child: ListView.builder(
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
