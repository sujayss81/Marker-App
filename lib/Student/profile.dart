import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  final Map data;
  Profile({this.data});
  @override
  Widget build(BuildContext context) {
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
          Text("USN: ${data['usn']}"),
          Text("Class: ${data['class']}"),
        ],
      ),
    );
  }
}
