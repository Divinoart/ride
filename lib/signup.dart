import 'package:flutter/material.dart';
import 'package:riding_app/loginform.dart';
import 'package:riding_app/services/authservice.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              child: Form(
                  key: formKey, child: _buildSignUpForm(scaffoldContext)))),
    ));
  }

  _buildSignUpForm(BuildContext scaffoldContext) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 75.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Signup',
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
            SizedBox(height: 25.0),
            TextFormField(
                style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
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
                validator: (value) =>
                    value.isEmpty ? 'Email is required' : validateEmail(value)),
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
            SizedBox(height: 25.0),
            _isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
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
            SizedBox(height: 25.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Alread a part of ride?',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'Montserrat')),
              SizedBox(width: 5.0),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)))
            ])
          ],
        ));
  }

  Future<void> signUp(BuildContext scaffoldContext) async {
    setState(() {
      _isLoading = true;
    });

    await AuthService().signUpUser(email, password, scaffoldContext);

    setState(() {
      _isLoading = false;
    });
  }
}
