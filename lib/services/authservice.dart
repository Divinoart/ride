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
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return Dashboard();
        } else {
          return SignIn();
        }
      });


  }

  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
       print('Welcome '  + email);
      if (value.user != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }

    }).catchError((e) {

    });
  }
  signUp(String email, String password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  }
}