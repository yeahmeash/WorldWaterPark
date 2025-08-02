import 'package:animated_loading_bar/animated_loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';

import '../auth/LoginScreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.off(() => LoginScreen()); // Navigate to login screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff4f8), // Match theme color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with your app logo
              height: 120,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedLoadingBar(
                colors: [Colors.red, Colors.blue],
                height: 20.0,
                duration: Duration(seconds: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
