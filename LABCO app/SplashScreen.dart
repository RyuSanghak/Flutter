import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:labco_particlemonitor/Search_screen.dart';
import 'package:labco_particlemonitor/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Splash',
        home: AnimatedSplashScreen(
            duration: 5000,
            splash: Column(
              children: <Widget>[
                Expanded(child: Image(
                  image: AssetImage('assets/labcologo.png'),
                ))
              ],
            ),
            nextScreen: MainPage(),
            splashIconSize: 50,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: const Duration(seconds: 2),
            backgroundColor: Colors.white));
  }
}
