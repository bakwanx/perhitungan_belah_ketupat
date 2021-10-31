import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nim_1801013026/theme.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/signin')
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 130,
          height: 130,
          child: Image.asset(
            imgSplash
          ),
        ),
      ),
    );
  }
}
