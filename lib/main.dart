import 'package:bagapp/screens/page1.dart';
import 'package:bagapp/screens/registration.dart';
import 'package:bagapp/screens/splashpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashPage(),
      //home: Registration(),
      home: Page1(),
    );
  }
}

