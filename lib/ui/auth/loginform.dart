import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riding_app/services/authservice.dart';
import 'package:riding_app/ui/auth/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = new GlobalKey<FormState>();

  //Cheap way to look at the loading state
  bool _isLoading = false;
  bool _isVisible = false;

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
        body: Builder(
      builder: (BuildContext scaffoldContext) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child:
                  Form(key: formKey, child: _buildLoginForm(scaffoldContext)))),
    ));
  }

  _buildLoginForm(BuildContext scaffoldContext) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(height: 75.0),
              Row(
                children: [
                  Text('Hello',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('There',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold)),
                    Text('.',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 60.0,
                            color: Color(0xffFFDF00),
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              TextFormField(
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  onChanged: (value) {
                    this.email = value;
                  },
                  validator: (value) => value.isEmpty
                      ? 'Email is required'
                      : validateEmail(value)),
              SizedBox(height: 15.0),
              TextFormField(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat'),
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          child: Icon(_isVisible
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  obscureText: _isVisible,
                  onChanged: (value) {
                    this.password = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Password is required' : null),
              SizedBox(height: 5.0),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                          child: Text('Forgot Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontSize: 11.0,
                                  decoration: TextDecoration.underline))))),
              SizedBox(height: 25.0),
              _isLoading
                  ? SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Color(0xffFFDF00)),
                        ),
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 25.0),
              GestureDetector(
                onTap: () {
                  if (checkFields()) {
                    signIn(scaffoldContext);
                  }
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'))))),
              ),
              SizedBox(height: 25.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('New to Ride?',
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Montserrat')),
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
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)))
              ])
            ]));
  }

  Future<void> signIn(BuildContext scaffoldContext) async {
    setState(() {
      _isLoading = true;
    });

    await AuthService().signIn(email, password, scaffoldContext);

    setState(() {
      _isLoading = false;
    });
  }
}
