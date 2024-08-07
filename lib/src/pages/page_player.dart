import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:public_iptv/src/models/stream_channel.dart';

class PagePlayer extends StatefulWidget {
  final StreamChannel channel;
  const PagePlayer({super.key, required this.channel});

  @override
  State<PagePlayer> createState() => _PagePlayerState();
}

class _PagePlayerState extends State<PagePlayer> {
  late BetterPlayerController _betterPlayerController;

  void initPlayer() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.channel.url,
    );
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          autoPlay: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableSkips: false,
            enableOverflowMenu: false,
            enableProgressBar: false,
          ),
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
  }

  void disposePlayer() {
    _betterPlayerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: _aspectRatio(),
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
}
