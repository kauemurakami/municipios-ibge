import 'package:brasiltransparenteapp/screens/android/splash/splash_screen.dart';
import 'package:brasiltransparenteapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasil Transparente',
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
