import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:public_iptv/src/models/stream_channel.dart';

class PagePlayer extends StatefulWidget {
  final StreamChannel channel;
  final List<StreamChannel> channels;
  const PagePlayer({super.key, required this.channel, required this.channels});

  @override
  State<PagePlayer> createState() => _PagePlayerState();
}

class _PagePlayerState extends State<PagePlayer> {
  late BetterPlayerController _betterPlayerController;
  StreamChannel? _currentChannel;
  String _currentId = "";
  final ScrollController _scrollController = ScrollController();

  void initPlayer() {
    _currentChannel = widget.channel;
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.channel.url,
    );
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          autoPlay: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableSkips: false,
            enableFullscreen: true,
            playerTheme: BetterPlayerTheme.cupertino,
            enableOverflowMenu: true,
            enableProgressBar: true,
            enableProgressBarDrag: false,
            liveTextColor: Colors.red,
          ),
          allowedScreenSleep: false,
          aspectRatio: 16 / 9,
          fit: BoxFit.contain,
          deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
          deviceOrientationsOnFullScreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight
          ],
          fullScreenByDefault: false,
          fullScreenAspectRatio: 16 / 9,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
    _betterPlayerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.play) {
        KeepScreenOn.turnOn();
        _betterPlayerController.seekTo(
            _betterPlayerController.videoPlayerController!.value.position);
      } else if (event.betterPlayerEventType == BetterPlayerEventType.pause) {
        KeepScreenOn.turnOff();
      }
    });
  }

  void disposePlayer() {
    _betterPlayerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
    _currentId = widget.channel.id;
  }

  @override
  void dispose() {
    disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _aspectRatio(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      _currentChannel?.logo ?? '',
                      height: 20.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _currentChannel?.name ?? 'No channel selected',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _showChannels(controller: _scrollController)),
        ],
      ),
    ));
  }

  AspectRatio _aspectRatio() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }

  _showChannels({controller}) {
    return Scrollbar(
      interactive: true,
      thickness: 8.0,
      radius: const Radius.circular(8.0),
      controller: controller,
      child: ListView.builder(
        controller: controller,
        itemCount: widget.channels.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: AspectRatio(
              aspectRatio: 1 / 1,
              child: FadeInImage(
                image: NetworkImage(
                  widget.channels[index].logo,
                ),
                fit: BoxFit.contain,
                placeholder: const AssetImage('assets/images/logo.png'),
                imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: Text(
              widget.channels[index].name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${widget.channels[index].categories.join(', ')} - ${widget.channels[index].country}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            selected: _currentId == widget.channels[index].id,
            selectedColor: Theme.of(context).colorScheme.surface,
            selectedTileColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
            onTap: () {
              if (_currentId == widget.channels[index].id) {
                return;
              }
              _betterPlayerController.setupDataSource(
                BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  widget.channels[index].url,
                ),
              );
              setState(() {
                _currentChannel = widget.channels[index];
                _currentId = widget.channels[index].id;
              });
            },
          );
        },
      ),
    );
  }
}
