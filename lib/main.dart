import 'package:flutter/material.dart';
import 'package:owotion/result_page.dart';
import 'package:owotion/start_page.dart';
import 'package:owotion/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Owotion by Nyastral',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/result': (context) => ResultPage(
            key: ValueKey('ResultPageKey'), resultText: ''),
      },
    );
  }
}
