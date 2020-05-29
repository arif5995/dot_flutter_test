import 'dart:async';

import 'package:dotfluttertest/ui/page/page_dashboard.dart';
import 'package:dotfluttertest/ui/page/page_place.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    splashscreenStart();
  }

  //Duration Splash
  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "DOT Flutter Test",
                  style: TextStyle(fontFamily: 'Childern', fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Versi 1.0.0",
                    style: TextStyle(fontFamily: 'Childern', fontSize: 12),
                  ),
                ),
              ),
            ],
      )),
    );
  }
}
