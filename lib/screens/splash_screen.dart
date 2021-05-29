import 'package:fleet_management/screens/login_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {

  static String id="/SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getSplashTransition();
  }

  getSplashTransition() async{
    Future.delayed(Duration(seconds: 2)).whenComplete(() =>
      Navigator.pushReplacementNamed(context, LoginScreen.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logoAnimation',
            child: Image.asset(
              'assets/images/dart_logo.png',
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Schedule App",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
