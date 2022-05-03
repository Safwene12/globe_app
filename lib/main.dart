import 'package:flutter/material.dart';
import 'package:globe_app/screens/session_screen.dart';
import 'package:globe_app/screens/weather_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BMIScreen(),
        '/weather':(context)=> const WeatherScreen(),
        '/training':(context)=> const SessionsScreen(),
      },
      initialRoute: '/',
    );
  }
}


