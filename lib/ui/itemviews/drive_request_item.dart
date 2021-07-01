import 'package:flutter/material.dart';

class DriveRequestItem extends StatelessWidget {
  const DriveRequestItem({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        width: deviceSize.width,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              width: deviceSize.width - 200,
              child: Text('Hi, I am driving to SLC fomr Rexburg and then from SLC back to Rexburg',
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'
                  )),
            )
          ],
        ),
      ),
      
    );
  }
}