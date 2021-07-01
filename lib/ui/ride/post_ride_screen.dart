import 'package:flutter/material.dart';

class PostRideScreen extends StatefulWidget {
  const PostRideScreen({Key key}) : super(key: key);

  @override
  _PostRideScreenState createState() => _PostRideScreenState();
}

class _PostRideScreenState extends State<PostRideScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                          child: Icon(
                        Icons.menu_outlined,
                        size: 25,
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Post Ride',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  Text('.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          color: Color(0xffFFDF00),
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextField(
                      maxLines: 15,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Montserrat'),
                      decoration: InputDecoration(
                        fillColor: Colors.blueGrey.withOpacity(0.1),
                        filled: true,
                        hintText: 'Description..',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: 'Montserrat'),
                        errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 70,
                            height: 70,
                            child: TextFormField(
                                maxLength: 2,
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Montserrat'),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'MM',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        color: Colors.grey.withOpacity(0.5)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    )),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please select the month of this ride';
                                  }
                                  return null;
                                })),
                        SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                            width: 70,
                            height: 70,
                            child: TextFormField(
                                maxLength: 2,
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Montserrat'),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'DD',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        color: Colors.grey.withOpacity(0.5)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    )),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please select the day of this ride';
                                  }
                                  return null;
                                })),
                        SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                            width: 70,
                            height: 70,
                            child: TextFormField(
                                maxLength: 4,
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Montserrat'),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'YYYY',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        color: Colors.grey.withOpacity(0.5)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    )),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please select the year of this ride';
                                  }
                                  return null;
                                }))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 50.0,
                            width: 200,
                            child: Material(
                                shadowColor: Colors.black,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(
                                      color: Colors.black,
                                    )),
                                child: Center(
                                    child: Text('Choose Time',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')))))),
                    SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 50.0,
                            width: 300,
                            child: Material(
                                borderRadius: BorderRadius.circular(25.0),
                                shadowColor: Colors.black,
                                color: Colors.black,
                                elevation: 7.0,
                                child: Center(
                                    child: Text('Post',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')))))),
              ])),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
