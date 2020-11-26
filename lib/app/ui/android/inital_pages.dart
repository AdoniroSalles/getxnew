//SPLASH SCRREN, LEVA PRA TELA DE LOGIN

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:projeto_getx/app/routes/app_pages.dart';
import 'package:splashscreen/splashscreen.dart';

class InitalPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 10,
          gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.green[300], Colors.green[600]]),
          navigateAfterSeconds: Routes.LOGIN,
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/tree.png"), fit: BoxFit.contain)),
        )
      ],
    );
  }
}
