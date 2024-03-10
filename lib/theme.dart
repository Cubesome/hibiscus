import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  canvasColor: Colors.white,
  primaryColor: Color(0xffffffff),
  hintColor: Color(0xff888888),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xffffffff),
    foregroundColor: Color(0xff212121),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.normal,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xff212121)),
);

ThemeData darkTheme = ThemeData(
  canvasColor: Color(0xff101010),
  primaryColor: Color(0xff202020),
  hintColor: Color(0xff888888),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xff212121),
    foregroundColor: Color(0xffffffff),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.normal,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xffffffff)),
);
