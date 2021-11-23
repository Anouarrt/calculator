


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData DarkTheme = ThemeData(

  primarySwatch: drafultColor,  // pour Chnage Tous Les Coleurs Par defauls a  l'Orange
  scaffoldBackgroundColor:HexColor("333739"),
  floatingActionButtonTheme: FloatingActionButtonThemeData(

  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor("333739"),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,

      fontSize: 20,

    ),
    backwardsCompatibility: false,
    // Pour Tu peux Le Faire Comme Tu veux Sur Status Bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,  // status => Pour Modifier Les Colors de les icons
      statusBarColor: HexColor("333739"),

    ),

  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: Colors.white,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor("333739"),
    unselectedItemColor: Colors.grey,

  ),
  //    scaffoldBackgroundColor: Colors.black,


);

ThemeData LightTheme =  ThemeData(        // Pour Applique A bar Completement de L'Applications
  primarySwatch: drafultColor,  // pour Chnage Tous Les Coleurs Par defauls a  l'Orange
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
   // backgroundColor: Colors.green,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.red,
      fontFamily: 'Roboto',
      fontSize: 20,
    ),
    backwardsCompatibility: false, // Pour Tu peux Le Faire Comme Tu veux Sur Status Bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,  // status => Pour Modifier Les Colors
      statusBarColor: Colors.green,

    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        fontFamily: 'Roboto',
        color: Colors.black,
      )
  ),


);