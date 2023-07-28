import 'package:flutter/material.dart';
import 'dart:async';

class ThemeModule {
  ThemeData _selectedTheme = ThemeData();
  Timer _timer = Timer(Duration.zero, () {});

  final ThemeData _lightTheme = ThemeData(
    primaryColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );
  final ThemeData _darkTheme = ThemeData(
    primaryColor: Colors.brown,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );

  ThemeData get selectedTheme => _selectedTheme;

  void selectTheme() {
    print("selectedtheme");
    // Current time
    DateTime now = DateTime.now();
    // Dark theme start time evening 7 pm
    DateTime darkThemeStartTime = DateTime(now.year, now.month, now.day, 12);
    // Dark theme to Light switch happen at 6 am
    DateTime darkThemeEndTime = DateTime(now.year, now.month, now.day, 6);

    int timerSeconds;

    if (now.compareTo(darkThemeEndTime) > 0 &&
        now.compareTo(darkThemeStartTime) < 0) {
      print('lightTheme');
      _selectedTheme = _lightTheme;
      timerSeconds = darkThemeStartTime.difference(now).inSeconds;
    } else if (now.compareTo(darkThemeStartTime) > 0) {
      print('darkTheme');
      _selectedTheme = _darkTheme;
      DateTime nextDayMorningTime = darkThemeStartTime.add(Duration(days: 1));
      timerSeconds = nextDayMorningTime.difference(now).inSeconds;
    } else {
      print('darkTheme');
      _selectedTheme = _darkTheme;
      timerSeconds = darkThemeEndTime.difference(now).inSeconds;
    }

    _timer = Timer(
      Duration(seconds: timerSeconds),
          () {
        selectTheme();
      },
    );
  }

  void dispose() {
    _timer.cancel();
  }
}
