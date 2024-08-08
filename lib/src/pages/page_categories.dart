import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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
  final ScrollController _semicircleController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceCategory.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data as List<Category>;
            return DraggableScrollbar.semicircle(
              controller: _semicircleController,
              labelTextBuilder: (offset) {
                final int currentItem = _semicircleController.hasClients
                    ? (_semicircleController.offset /
                            _semicircleController.position.maxScrollExtent *
                            categories.length)
                        .floor()
                    : 0;

                return Text(
                  categories[currentItem].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              labelConstraints:
                  const BoxConstraints.tightFor(width: 150.0, height: 30.0),
              child: ListView.builder(
                controller: _semicircleController,
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
