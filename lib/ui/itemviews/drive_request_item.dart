import 'package:flutter/material.dart';

class DriveRequestItem extends StatelessWidget {
  const DriveRequestItem({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 7,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        width: deviceSize.width,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xffFFDF00),
              child: Icon(
                Icons.drive_eta,
                color: Colors.white,
                size: 25,
              ),
            ),
            SizedBox(
              width: 10
            ),
            SizedBox(
              width: deviceSize.width - 150,
              child: Text('Hi, I am driving to SLC from Rexburg and then from SLC back to Rexburg',
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat'
                  )),
            ),
            
          ],
        ),
      ),
      
    );
  }
}