import 'package:flutter/material.dart';
import 'package:public_iptv/src/models/category.dart';
import 'package:public_iptv/src/models/channel_option.dart';
import 'package:public_iptv/src/pages/page_channels_by.dart';
import 'package:public_iptv/src/services/service_category.dart';

class PageCategories extends StatefulWidget {
  const PageCategories({super.key});

  @override
  State<PageCategories> createState() => _PageCategoriesState();
}

class _PageCategoriesState extends State<PageCategories> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceCategory.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data as List<Category>;
            return Scrollbar(
              controller: _controller,
              interactive: true,
              thickness: 8.0,
              radius: const Radius.circular(8.0),
              child: ListView.builder(
                controller: _controller,
                padding: const EdgeInsets.all(8.0),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(categories[index].name.characters.first,
                            style: const TextStyle(fontSize: 24)),
                      ),
                      title: Text(categories[index].name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageChannelsBy(
                                      option: ChannelOption.channelsByCategory,
                                      title: categories[index].name,
                                      variant: categories[index].id,
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
