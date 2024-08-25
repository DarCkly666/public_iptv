import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:public_iptv/src/provider/theme_notifier.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({super.key});

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
          forceMaterialTransparency: true,
        ),
        body: ListView(
          children: [
            ListTile(
                title: const Text('Change theme'),
                leading: const Icon(Icons.light_mode_outlined),
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Change theme'),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile<ThemeMode>(
                                title: const Text('Light Theme'),
                                value: ThemeMode.light,
                                groupValue: themeNotifier.themeMode,
                                onChanged: (ThemeMode? value) {
                                  if (value != null) {
                                    themeNotifier.setTheme(value);
                                  }
                                },
                              ),
                              RadioListTile<ThemeMode>(
                                title: const Text('Dark Theme'),
                                value: ThemeMode.dark,
                                groupValue: themeNotifier.themeMode,
                                onChanged: (ThemeMode? value) {
                                  if (value != null) {
                                    themeNotifier.setTheme(value);
                                  }
                                },
                              ),
                              RadioListTile<ThemeMode>(
                                title: const Text('System Theme'),
                                value: ThemeMode.system,
                                groupValue: themeNotifier.themeMode,
                                onChanged: (ThemeMode? value) {
                                  if (value != null) {
                                    themeNotifier.setTheme(value);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
