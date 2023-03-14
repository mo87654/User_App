
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'layout/user_layout.dart';
import 'modules/login screen/login.dart';

bool? isLogin ;

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
      home: isLogin == false? Login(): UserLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

