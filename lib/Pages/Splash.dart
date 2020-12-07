import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:openbanking/Pages/Home.dart';
import 'package:openbanking/Pages/LoginPage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flare_dart/actor.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          navigateAfterSeconds: LoginPage(),
          loaderColor: Colors.transparent,
        ),
        FlareActor(
          "assets/openminer2.flr",
          shouldClip: false,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
          animation: "Background Loop",
        ),
      ],
    );
  }
}
