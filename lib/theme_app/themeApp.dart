 import 'package:flutter/material.dart';

 class MyThemeData{
   static final Primaty_color=Color.fromRGBO(255, 187, 59, 1.0);
   static final BotomBarColor=Color.fromRGBO(26, 26, 26, 1.0);
   static final gray=Color.fromRGBO(204, 204, 204, 1.0);
   static final darkgray=Color.fromRGBO(92, 92, 92, 1.0);
 }
class ThemeApp{

  static ThemeData themeData=ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor:MyThemeData.darkgray ,
      selectedItemColor: MyThemeData.Primaty_color,
      unselectedItemColor: MyThemeData.gray,
    ),
    scaffoldBackgroundColor: Colors.black
  );

 }
