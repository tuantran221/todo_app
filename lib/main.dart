import 'package:flutter/material.dart';
import 'package:todo_app/screen/home.dart';
import 'package:todo_app/constant/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeModule _themeModule = ThemeModule();

  @override
  void initState() {
    _themeModule.selectTheme();
    super.initState();
  }

  @override
  void dispose() {
    _themeModule.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: _themeModule.selectedTheme,
      home: Home(),
    );
  }
}
