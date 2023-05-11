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
      title: const Text('',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,letterSpacing: 1.5,
            color: Color(0xff515281)
          )),
      image: Image.asset('assets/images/wifibus.jpg'),
      // الصورة التي ستظهر في شاشة Splash Screen
      backgroundColor: Colors.white,
      photoSize: 225.0 ,
      // حجم الصورة في شاشة Splash Screen
      loaderColor: Color(0xff515281), // لون دائرة التحميل في شاشة Splash Screen4
    );
  }
}