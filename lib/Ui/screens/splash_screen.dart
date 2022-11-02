
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';


import '../../constants.dart';
import 'login_screen.dart';

class SplashAnimatedScreen extends StatelessWidget {
  const SplashAnimatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: AnimatedSplashScreen(
            backgroundColor: kPrimaryColor,
            duration: 3000, //speed
            splash: Center(
              child: Lottie.network(
                  "https://assets1.lottiefiles.com/packages/lf20_fgJ6rToXyA.json",
                  fit: BoxFit.cover),
            ),
            nextScreen: LoginPage(),
          ),
      ),
    );
  }
}

/*

*/