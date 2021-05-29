import 'package:fleet_management/dashboard.dart';
import 'package:fleet_management/login_screen.dart';
import 'package:fleet_management/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        SplashScreen.id:(context)=>SplashScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        DashBoard.id:(context)=>DashBoard(),
      },
    );
  }
}
