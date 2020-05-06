import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  final Map data;
  Profile({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical:MediaQuery.of(context).size.height * 0.05,),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.png"),
            radius: MediaQuery.of(context).size.width * 0.2,
          ),
          Divider(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
              "Name",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "${data["name"]}",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "USN",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),SizedBox(height: 10,),
          Text(
            "${data["usn"]}",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),
        ],
      ),
    );
  }
}

//child: Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Center(
//child: Text(
//data['name'],
//style: TextStyle(
//fontSize: 40.0,
//letterSpacing: 2.0,
//fontWeight: FontWeight.w300,
//),
//),
//),
//Text("USN: ${data['usn']}"),
//Text("Class: ${data['class']}"),
//],
//),