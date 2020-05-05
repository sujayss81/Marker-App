import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  final Map data;
  MyProfile({this.data});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    Map data = widget.data;
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[300]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                data['name'],
                style: TextStyle(
                  fontSize: 40.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Text("Employee ID: ${data['e_id']}"),
            Text("Subject Name: ${data['sub_name']}"),
          ],
        ),
      );
  }
}
