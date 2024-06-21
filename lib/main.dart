import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/about_me.dart';
// import 'globals.dart' as globals;
import './screens/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'click';
  int currentNavigationIndex = 0;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/about': (BuildContext context) => const AboutMe()
      },
    );
  }
}
