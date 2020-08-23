import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  canvasColor: Colors.white,
  primaryColor: Color(0xffffffff),
  accentColor: Color(0xff212121),
  hintColor: Color(0xff888888),
  backgroundColor: Color(0xffffffff),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xffffffff),
    foregroundColor: Color(0xff212121),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.normal,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  canvasColor: Color(0xff101010),
  primaryColor: Color(0xff202020),
  accentColor: Color(0xffffffff),
  hintColor: Color(0xff888888),
  backgroundColor: Color(0xff252525),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xff212121),
    foregroundColor: Color(0xffffffff),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.normal,
    ),
  ),
);