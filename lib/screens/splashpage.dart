import 'dart:async';

import 'package:bagapp/screens/loginpage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Image(image: AssetImage("assets/icons/bag.png"),height: 160,width: 160,),
      ),
    );
  }
}
