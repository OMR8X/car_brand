import 'package:flutter/material.dart';

class ThemeProvider {
  getCurrentTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffF6F6F6),
      cardColor: const Color(0xff252525),
      primaryColor: const Color(0xffFFFFFF),
      appBarTheme: appBarTheme,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff252525)),
      useMaterial3: true,
    );
  }

  get appBarTheme => AppBarTheme(
        backgroundColor: const Color(0xffF6F6F6),
        shadowColor: Colors.black.withOpacity(0.1),
        surfaceTintColor: const Color(0xffF6F6F6),
        titleTextStyle: const TextStyle(
          fontFamily: "Almarai",
          fontSize: 23,
          color: Colors.black,
        ),
      );
}
