import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:riding_app/ui/auth/loginform.dart';
import 'package:riding_app/ui/auth/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //Size  = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                children: [
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset("assets/images/cover.jpeg", scale: 3.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Let'z Create a fun ride",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  )),
                              Text("together",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0,
                                    color: Color(0xffFFDF00),
                                  )),
                              SizedBox(
                                height: 50.0,
                              ),
                              Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width - 20,
                                child: Material(
                                    borderRadius: BorderRadius.circular(50.0),
                                    shadowColor: Colors.black,
                                    color: Colors.black,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignIn()),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ))),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width - 20,
                                child: Material(
                                    borderRadius: BorderRadius.circular(50.0),
                                    shadowColor: Colors.black,
                                    color: Colors.black,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignUp()),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'REGISTER',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
