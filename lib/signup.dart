import 'package:flutter/material.dart';
import 'package:riding_app/services/authservice.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = new GlobalKey<FormState>();

  //Cheap way to look at the loading state
  bool isLoading = false;

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
          child: Form(key: formKey, child: _buildSignUpForm(scaffoldContext))),
    ));
  }

  _buildSignUpForm(BuildContext scaffoldContext) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
          children: [
            SizedBox(height: 75.0),
            Container(
                height: 125.0,
                width: 200.0,
                child: Stack(
                  children: [
                    Text('Signup',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat sans-serif',
                            fontSize: 60.0)),
                    Positioned(
                        top: 62.0,
                        left: 170.0,
                        child: Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFDF00))))
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
            SizedBox(height: 25.0),
            isLoading
                ? SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(),
            SizedBox(height: 25.0),
            GestureDetector(
              onTap: () {
                if (checkFields()) {
                  signUp(scaffoldContext);
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
                          child: Text('SIGN UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat sans-serif'))))),
            ),
          ],
        ));
  }

  Future<void> signUp(BuildContext scaffoldContext) async {
    setState(() {
      isLoading = true;
    });

    await AuthService().signUpUser(email, password, scaffoldContext);

    setState(() {
      isLoading = false;
    });
  }
}
