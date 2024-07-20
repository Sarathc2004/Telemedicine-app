import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_app/view/bottomnavscreen/bottomnavscreen.dart';
import 'package:telemedicine_app/view/registerloginscreen/registerscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isloading = true;
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      isloading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isloading == false) {
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Bottomnavscreen();
          } else {
            return RegisterScreen();
          }
        },
      );
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/telemedicinelogo.jpg"))
          ],
        ),
      );
    }
  }
}
