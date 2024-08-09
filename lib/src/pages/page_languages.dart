import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/models/language.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';
import 'package:public_iptv/src/services/service_language.dart';

class PageLanguages extends StatelessWidget {
  const PageLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> alphabet =
        List<String>.generate(26, (index) => String.fromCharCode(65 + index));

    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Ajusta según tu diseño
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: alphabet.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageLanguagesByLetter(
                    letter: alphabet[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Center(
                child: Text(
                  alphabet[index],
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PageLanguagesByLetter extends StatefulWidget {
  final String? letter;

  const PageLanguagesByLetter({super.key, required this.letter});

  @override
  State<PageLanguagesByLetter> createState() => _PageLanguagesByLetterState();
}

class _PageLanguagesByLetterState extends State<PageLanguagesByLetter> {
  final ScrollController _semicircleController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        forceMaterialTransparency: true,
      ),
      body: FutureBuilder<List<Language>>(
        future: ServiceLanguage.getLanguagesByLetter(widget.letter ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading languages'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No languages found'));
          }

          List<Language> languages = snapshot.data!;
          return DraggableScrollbar.semicircle(
            controller: _semicircleController,
            child: ListView.builder(
              controller: _semicircleController,
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(languages[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageChannelsBy(
                          option: ChannelOption.channelsByLanguage,
                          title: languages[index].name,
                          variant: languages[index].code,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
