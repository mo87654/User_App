import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutMessage extends StatelessWidget {
  final VoidCallback onSignOut;

  SignOutMessage({required this.onSignOut});

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
          onPressed: onSignOut,
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}
//hello