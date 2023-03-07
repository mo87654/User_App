import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login screen/login.dart';


class Homepage extends StatefulWidget{
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,

                children:  const [


                ],
              ),
            ],
          ),
        ),
      );




  }
}