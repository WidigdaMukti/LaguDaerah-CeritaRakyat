import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData backgroundcolor1() {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xffFFFFFF),
    );
  }

  static BoxDecoration gradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xffE0E0E0),
          Color(0xfffdfbfb),
        ], // Sesuaikan warna sesuai keinginan Anda
      ),
    );
  }
}
