import 'package:flutter/material.dart';
import 'package:nim_1801013026/pages/input_form.dart';
import 'package:nim_1801013026/pages/ketupat_main.dart';
import 'package:nim_1801013026/pages/signin.dart';
import 'package:nim_1801013026/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashScreen(),
        '/signin' : (context) => SignIn(),
        '/main-ketupat' : (context) => KetupatMain(),
        '/input-form' : (context) => InputForm()
      },
    );
  }
}

