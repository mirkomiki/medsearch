
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:medsearch/Pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medsearch/Pages/pages.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {

    return SizedBox.expand(
      child: AnimatedSplashScreen(
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        
        splashIconSize: 500,
        duration: 6000,
        splash: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 2, child: Image(image: AssetImage('assets/transparent_logo.png'), fit: BoxFit.fitHeight),),
              
              Expanded(flex: 2,child: SpinKitChasingDots(
                size: 50,
                color: Color.fromARGB(255, 0, 164, 164),
              ),)
              
          ],
        ),
        nextScreen: const Pages(),
      ),
    );
  }
}