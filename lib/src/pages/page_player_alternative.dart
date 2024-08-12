import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:video_player/video_player.dart';
import 'package:public_iptv/src/models/stream_channel.dart';

class PagePlayerAlternative extends StatefulWidget {
  final StreamChannel channel;
  final List<StreamChannel> channels;
  const PagePlayerAlternative(
      {super.key, required this.channel, required this.channels});

  @override
  State<PagePlayerAlternative> createState() => _PagePlayerAlternativeState();
}

class _PagePlayerAlternativeState extends State<PagePlayerAlternative> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  StreamChannel? _currentChannel;
  String _currentId = "";
  final ScrollController _scrollController = ScrollController();

  Future<void> initPlayer(String url) async {
    _currentChannel = widget.channel;
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      showOptions: false,
      showControls: true,
      aspectRatio: 16 / 9,
      allowFullScreen: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: false,
      allowedScreenSleep: false,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ],
      draggableProgressBar: false,
      isLive: true,
      errorBuilder: (context, error) {
        return const Center(
          child: Text('An error occurred'),
        );
      },
    );

    _chewieController?.addListener(() {
      if (_chewieController?.isPlaying == true) {
        KeepScreenOn.turnOn();
      } else {
        KeepScreenOn.turnOff();
      }
    });

    setState(() {});
  }

  void disposePlayer() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlayer(widget.channel.url);
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: FadeInImage(
                      image: NetworkImage(
                        _currentChannel?.logo ?? '',
                      ),
                      fit: BoxFit.contain,
                      placeholder: const AssetImage('assets/images/logo.png'),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
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
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      if (_chewieController?.isPlaying == true) {
                        _videoPlayerController
                            .seekTo(_videoPlayerController.value.duration);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'LIVE',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
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
      child: _chewieController != null
          ? Chewie(controller: _chewieController!)
          : const Center(
              child: CircularProgressIndicator(),
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
            onTap: () async {
              if (_currentId == widget.channels[index].id) {
                return;
              }
              disposePlayer();
              initPlayer(widget.channels[index].url);
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
