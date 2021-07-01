import 'package:flutter/material.dart';
import 'package:riding_app/ui/itemviews/drive_request_item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          width: deviceSize.width,
          height: Size.fromHeight(150).height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
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
              Row(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: deviceSize.height - Size.fromHeight(150).height,
        width: deviceSize.width,
        child: Stack(
          children: [
            ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int positon) {
                  return DriveRequestItem();
                }),
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
                                  fontFamily: 'Montserrat'))))),
            ),
          ],
        ),
      ),
    );
  }
}
