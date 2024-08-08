import 'package:flutter/material.dart';
import 'package:public_iptv/src/pages/page_categories.dart';
import 'package:public_iptv/src/pages/page_channels.dart';
import 'package:public_iptv/src/pages/page_countries.dart';
import 'package:public_iptv/src/pages/page_languages.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final List<String> _pages = <String>[
    'countries',
    'categories',
    'languages',
    'all',
  ];
  String _currentPage = 'countries';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public IPTV'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        forceMaterialTransparency: true,
      ),
      body: IndexedStack(
        index: _pages.indexOf(_currentPage),
        children: const <Widget>[
          PageCountries(),
          PageCategories(),
          PageLanguages(),
          PageChannels(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('Public IPTV'),
            ),
            _drawerItem('Countries', Icons.public, 'countries'),
            _drawerItem('Categories', Icons.category, 'categories'),
            _drawerItem('Languages', Icons.language, 'languages'),
            _drawerItem('All', Icons.live_tv_rounded, 'all'),
          ],
        ),
      ),
    );
  }

  ListTile _drawerItem(String title, IconData icon, String page) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        setState(() {
          _currentPage = page;
        });
        Navigator.pop(context);
      },
      selected: _currentPage == page,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
