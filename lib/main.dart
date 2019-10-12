import 'package:flaguru/screens/demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/menu_screen.dart';
import 'screens/play_screen.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New name here',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Quicksand',
      ),
      initialRoute: MenuScreen.routeName,
      routes: {
        MenuScreen.routeName: (context) => MenuScreen(),
        PlayScreen.routeName: (context) => PlayScreen(),
        '/': (context) => MenuScreen(),
        '/PlayScreen' : (context) => PlayScreen(),
        
      },
    );
  }
}
