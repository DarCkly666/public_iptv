import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/language.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';
import 'package:public_iptv/src/services/service_language.dart';

class PageLanguages extends StatelessWidget {
  const PageLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceLanguage.getLanguages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Language> languages = snapshot.data as List<Language>;
            languages.sort((a, b) => a.name.compareTo(b.name));
            return Scrollbar(
              child: ListView.builder(
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
