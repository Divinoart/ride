import 'package:flutter/material.dart';

class RideDetailsScreen extends StatefulWidget {
  const RideDetailsScreen({Key key}) : super(key: key);

  @override
  _RideDetailsScreenState createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(
          children: [
            Container(
              height: deviceSize.height - 300,
              width: deviceSize.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              child: Center(
                child: Text('Map',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Icon(
                    Icons.menu_outlined,
                    size: 30,
                  )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: deviceSize.height - 200,
                width: deviceSize.width,
                padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xffFFDF00),
                    child: Icon(
                      Icons.drive_eta,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Hi, I am driving to SLC fomr Rexburg and then from SLC back to Rexburg',
                      maxLines: 4,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'Montserrat')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 20),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text('Driver: Jane Doe',
                      maxLines: 4,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'Montserrat')),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Ratings: 4.5',
                      maxLines: 4,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'Montserrat')),
                  SizedBox(
                    height: 30,
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
                                  child: Text('Take Ride',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')))))),
                  SizedBox(
                    height: 70,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
