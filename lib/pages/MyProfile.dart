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
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "Employee ID",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),SizedBox(height: 10,),
          Text(
            "${data["e_id"]}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.height *0.055,
            ),
          ),
        ],
      ),
    );
  }
}
