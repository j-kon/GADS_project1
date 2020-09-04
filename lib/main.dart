import 'package:aad_practice_project/screens/screen_one.dart';
import 'package:aad_practice_project/screens/screen_two.dart';
import 'package:aad_practice_project/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ScreenTwo.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        ScreenOne.id: (context) => ScreenOne(),
        ScreenTwo.id: (context) => ScreenTwo(),
      },
    );
  }
}
