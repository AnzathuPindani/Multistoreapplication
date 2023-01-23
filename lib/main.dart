import 'package:flutter/material.dart';
import 'package:siopa/main_screens/welcome_screen.dart';
import 'package:siopa/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          // centerTitle: true,
          backgroundColor: xBlack87,
          iconTheme: IconThemeData(color: xWhite),
          titleTextStyle: TextStyle(fontFamily: "Poppins", color: xWhite),
          actionsIconTheme: IconThemeData(color: xWhite),
        ),
        tabBarTheme:
            const TabBarTheme(labelStyle: TextStyle(fontFamily: "Poppins")),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: xBlack87,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontFamily: "Poppins", color: xWhite),
          headline2: TextStyle(fontFamily: "Poppins", color: xWhite),
          headline3: TextStyle(fontFamily: "Poppins", color: xWhite),
          bodyText1: TextStyle(fontFamily: "Poppins", color: xWhite),
          bodyText2: TextStyle(fontFamily: "Poppins", color: xWhite),
          subtitle1: TextStyle(fontFamily: "Poppins", color: xWhite),
          subtitle2: TextStyle(fontFamily: "Poppins", color: xWhite),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
