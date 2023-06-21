import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../login screen/login.dart';
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Login(),
      title: const Text('You follow as you see',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,letterSpacing: 1.5,
            color: Color(0xff515281)
          )),
      image: Image.asset('assets/images/wifibus.jpg'),

      backgroundColor: Colors.white,
      photoSize: 225.0 ,
      /*loadingText: const Text("loading",
          style: TextStyle(
            fontSize: 20.0,
        letterSpacing: 1.5,
        color: Color(0xff515281),
        fontWeight: FontWeight.bold,

      ),
      ),*/

      loaderColor: Color(0xff515281), // لون دائرة التحميل في شاشة Splash Screen4
    );
  }
}