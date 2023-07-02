
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_app/modules/login%20screen/login.dart';

class SignOutMessage extends StatefulWidget {

  SignOutMessage({super.key});

  @override
  State<SignOutMessage> createState() => _SignOutMessageState();
}

class _SignOutMessageState extends State<SignOutMessage> {
FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure you want to sign out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed:()async{
            await auth.signOut();
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => Login(),), (route) => false);
          },
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}
//hello