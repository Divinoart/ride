import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riding_app/signup.dart';

import '../dashboard.dart';
import 'package:riding_app/loginform.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Dashboard();
          } else {
            return SignIn();
          }
        });
  }

  Future<void> signIn(String email, String password, context) async {
    try {
      var value = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (value.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(e.toString(),
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Montserrat sans-serif'))));
    }
  }

  Future<void> signUpUser(
      String email, String password, BuildContext context) async {
    try {
      var value = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (value.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(e.toString(),
              style:
                  TextStyle(color: Colors.white, fontFamily: 'Montserrat'))));
    }
  }
}
