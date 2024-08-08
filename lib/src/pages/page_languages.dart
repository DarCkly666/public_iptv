import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/language.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';
import 'package:public_iptv/src/services/service_language.dart';

class PageLanguages extends StatefulWidget {
  const PageLanguages({super.key});

  @override
  State<PageLanguages> createState() => _PageLanguagesState();
}

class _PageLanguagesState extends State<PageLanguages> {
  final ScrollController _semicircleController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceLanguage.getLanguages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Language> languages = snapshot.data as List<Language>;
            languages.sort((a, b) => a.name.compareTo(b.name));
            return DraggableScrollbar.semicircle(
              controller: _semicircleController,
              labelTextBuilder: (offset) {
                final int currentItem = _semicircleController.hasClients
                    ? (_semicircleController.offset /
                            _semicircleController.position.maxScrollExtent *
                            languages.length)
                        .floor()
                    : 0;

                return Text(
                  languages[currentItem].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              labelConstraints:
                  const BoxConstraints.tightFor(width: 150.0, height: 30.0),
              child: ListView.builder(
                controller: _semicircleController,
                padding: const EdgeInsets.all(8.0),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(languages[index].name.characters.first,
                            style: const TextStyle(fontSize: 24)),
                      ),
                      title: Text(languages[index].name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageChannelsBy(
                                      option: ChannelOption.channelsByLanguage,
                                      title: languages[index].name,
                                      variant: languages[index].code,
                                    )));
                      },
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
