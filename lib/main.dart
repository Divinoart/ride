import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riding_app/splash.dart';
import 'package:riding_app/services/authservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          accentColor: Color(
            0xffFFDF00,
          )),
      home: Splash(),
    );
  }
}
