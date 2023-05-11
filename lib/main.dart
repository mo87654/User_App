
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:user_app/modules/home%20screen/SplashScreen.dart';
import 'package:user_app/modules/home%20screen/home.dart';
import 'layout/user_layout.dart';
import 'modules/login screen/login.dart';


bool isLogin = false;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;

  if(user == null){
    isLogin = false ;
  }else{
    isLogin = true ;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
      BouncingScrollWrapper.builder(context, widget!),
      maxWidth: 1200,
      minWidth: 480,
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.autoScale(480, name: 'SM'),
        ResponsiveBreakpoint.autoScale(800, name: 'MD'),
        ResponsiveBreakpoint.autoScale(1000, name: 'LG'),
        ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
        ResponsiveBreakpoint.autoScale(2460, name: '2XL'),
      ],),

      home:isLogin == false? SplashScreenPage(): UserLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

