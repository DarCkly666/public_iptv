import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:public_iptv/src/pages/splash_screen.dart';
import 'package:public_iptv/src/provider/theme_notifier.dart';
import 'package:public_iptv/src/utils/constants.dart';
import 'package:public_iptv/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
          colorScheme: MaterialTheme.lightScheme(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: MaterialTheme.darkScheme(),
          useMaterial3: true,
        ),
        highContrastTheme: ThemeData(
          colorScheme: MaterialTheme.lightHighContrastScheme(),
          useMaterial3: true,
        ),
        highContrastDarkTheme: ThemeData(
          colorScheme: MaterialTheme.darkHighContrastScheme(),
          useMaterial3: true,
        ),
        themeMode: themeNotifier.themeMode,
        home: const SplashScreen(),
      );
    });
  }
}
