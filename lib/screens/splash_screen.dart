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
    Future.delayed(Duration(seconds: 4)).whenComplete(() =>
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
              'assets/images/fleet.png',
              // height: 200.0,
              // width: 200.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          // Text(
          //   "Fleet Management",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       fontSize: 16.0,
          //       fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
    );
  }
}
