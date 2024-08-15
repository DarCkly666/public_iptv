import 'package:flutter/material.dart';
import 'package:public_iptv/src/pages/page_categories.dart';
import 'package:public_iptv/src/pages/page_channels.dart';
import 'package:public_iptv/src/pages/page_countries.dart';
import 'package:public_iptv/src/pages/page_languages.dart';
import 'package:public_iptv/src/pages/page_settings.dart';
import 'package:public_iptv/src/utils/constants.dart';

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

  void handleClick(String value, BuildContext context) {
    switch (value) {
      case 'Settings':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PageSettings()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        forceMaterialTransparency: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) => handleClick(value, context),
            itemBuilder: (BuildContext context) {
              return {'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: ListTile(
                    title: Text(choice),
                    leading: const Icon(Icons.settings),
                  ),
                );
              }).toList();
            },
          ),
        ],
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                  child: Text(
                'Public IPTV',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                  shadows: [
                    Shadow(
                      color: Theme.of(context).colorScheme.surface,
                      blurRadius: 4.0,
                    ),
                  ],
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            _drawerItem('Countries', Icons.public, 'countries'),
            _drawerItem('Categories', Icons.category, 'categories'),
            _drawerItem('Languages', Icons.language, 'languages'),
            _drawerItem('Search', Icons.search_rounded, 'all'),
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
