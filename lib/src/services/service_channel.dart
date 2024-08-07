import 'package:flutter/services.dart';
import 'package:public_iptv/src/models/channel.dart';
import 'package:public_iptv/src/models/stream.dart';
import 'package:public_iptv/src/models/stream_channel.dart';

class ServiceChannel {
  static Future<List<StreamChannel>> getStreamChannels() async {
    String channelsString =
        await rootBundle.loadString('assets/data/channels.json');
    String streamsString =
        await rootBundle.loadString('assets/data/streams.json');

    List<Channel> channels = channelFromJson(channelsString);
    List<Stream> streams = streamFromJson(streamsString);

    Map<String, Stream> streamMap = {
      for (var stream in streams) stream.channel: stream
    };

    List<StreamChannel> streamChannels = channels
        .where((channel) => streamMap.containsKey(channel
            .id)) // Filtra solo los channels con streams correspondientes
        .map((channel) {
      final stream = streamMap[channel.id]!;
      return StreamChannel(
        id: channel.id,
        name: channel.name,
        altNames: channel.altNames,
        owners: channel.owners,
        country: channel.country,
        languages: channel.languages,
        categories: channel.categories,
        logo: channel.logo,
        isNsfw: channel.isNsfw,
        launched: channel.launched,
        closed: channel.closed,
        replacedBy: channel.replacedBy,
        website: channel.website,
        url: stream.url,
      );
    }).toList();

    return streamChannels;
  }

  static Future<List<StreamChannel>> getStreamChannelsByCategory(
      String category) async {
    List<StreamChannel> streamChannels = await getStreamChannels();
    return streamChannels
        .where((streamChannel) => streamChannel.categories.contains(category))
        .toList();
  }

  static Future<List<StreamChannel>> getStreamChannelsByCountry(
      String country) async {
    List<StreamChannel> streamChannels = await getStreamChannels();
    return streamChannels
        .where((streamChannel) => streamChannel.country == country)
        .toList();
  }

  static Future<List<StreamChannel>> getStreamChannelsByLanguage(
      String languageCode) async {
    List<StreamChannel> streamChannels = await getStreamChannels();
    return streamChannels
        .where(
            (streamChannel) => streamChannel.languages.contains(languageCode))
        .toList();
  }

  /*static Future<List<Channel>> getChannels() async {
    String response = await rootBundle.loadString('assets/data/channels.json');
    List<Channel> channels = channelFromJson(response);
    return channels;
  }

  static Future<List<Channel>> getChannelsByCategory(String category) async {
    List<Channel> channels = await getChannels();
    return channels
        .where((channel) => channel.categories.contains(category))
        .toList();
  }

  static Future<List<Channel>> getChannelsByCountry(String country) async {
    List<Channel> channels = await getChannels();
    return channels.where((channel) => channel.country == country).toList();
  }

  static Future<List<Channel>> getChannelsByLanguage(
      String languageCode) async {
    List<Channel> channels = await getChannels();
    return channels
        .where((channel) => channel.languages.contains(languageCode))
        .toList();
  }

  static Future<Stream?> getChannelById(String id) async {
    String response = await rootBundle.loadString('assets/data/streams.json');
    List<Stream> streams = streamFromJson(response);
    try {
      Stream stream = streams.firstWhere((stream) => stream.channel == id);
      return stream;
    } catch (e) {
      return null;
    }
  }
  */
}
