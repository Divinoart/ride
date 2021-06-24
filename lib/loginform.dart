import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riding_app/services/authservice.dart';
import 'package:riding_app/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm())));
  }

  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
    child: ListView(children: [
    SizedBox(height: 75.0),
    Container(
    height: 125.0,
    width: 200.0,
    child: Stack(
    children: [
    Text('Hello',
    style: TextStyle(fontFamily: 'Montserrat sans-serif', fontSize: 60.0, fontWeight: FontWeight.bold)),
    Positioned(
    top: 50.0,
    child: Text('There',
    style:
    TextStyle(fontFamily: 'Montserrat sans-serif', fontSize: 60.0, fontWeight: FontWeight.bold))),
    Positioned(
    top: 97.0,
    left: 155.0,
    child: Container(
    height: 10.0,
    width: 10.0,
    decoration: BoxDecoration(
    shape: BoxShape.circle, color: Color(0xffFFDF00))))
    ],
    )),
    SizedBox(height: 25.0),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'EMAIL',
    labelStyle: TextStyle(
    fontFamily: 'Montserrat sans-serif',
    fontSize: 12.0,
    color: Colors.grey.withOpacity(0.5)),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
    )),
    onChanged: (value) {
    this.email = value;
    },
    validator: (value) =>
    value.isEmpty ? 'Email is required' : validateEmail(value)),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'PASSWORD',
    labelStyle: TextStyle(
    fontFamily: 'Montserrat sans',
    fontSize: 12.0,
    color: Colors.grey.withOpacity(0.5)),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
    )),
    obscureText: true,
    onChanged: (value) {
    this.password = value;
    },
    validator: (value) =>
    value.isEmpty ? 'Password is required' : null),
    SizedBox(height: 5.0),
    GestureDetector(
    onTap: () {

    },
    child: Container(
    alignment: Alignment(1.0, 0.0),
    padding: EdgeInsets.only(top: 15.0, left: 20.0),
    child: InkWell(
    child: Text('Forgot Password',
    style: TextStyle(
    color: Colors.black,
    fontFamily: 'Montserrat sans',
    fontSize: 11.0,
    decoration: TextDecoration.underline))))),
    SizedBox(height: 50.0),
    GestureDetector(
    onTap: () {
        if (checkFields()) AuthService().signIn(email, password, context);
    },
    child: Container(
    height: 50.0,
    child: Material(
    borderRadius: BorderRadius.circular(25.0),
    shadowColor: Colors.black,
    color: Colors.black,
    elevation: 7.0,
    child: Center(
    child: Text('LOGIN',
    style: TextStyle(
    color: Colors.white, fontFamily: 'Montserrat sans'))))),
    ),

      SizedBox(height: 25.0),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('New to Ride ?'),
        SizedBox(width: 5.0),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text('Register',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat sans-serif',
                    decoration: TextDecoration.underline)))
      ])
    ]));
  }
}

