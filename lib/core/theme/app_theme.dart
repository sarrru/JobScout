import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: 'Roboto Regular',
      scaffoldBackgroundColor: const Color(0xFFF9F5FF),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF6A0DAD),
        elevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Roboto Bold',
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Roboto Regular',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF6A0DAD),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6A0DAD),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto Bold',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: 'Roboto Regular',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontFamily: 'Roboto Regular',
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Roboto Bold',
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            color: Color(0xFF6A0DAD),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto Bold',
          ),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFF6A0DAD),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.deepPurple.shade600,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color(0xFFE7D9F8),
      ),
    );
  }
}
