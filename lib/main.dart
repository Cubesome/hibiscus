import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hibiscus/theme.dart';
import 'package:hibiscus/start_page.dart';
import 'package:hibiscus/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Owotion by Cubesome',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}