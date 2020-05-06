import 'package:flutter/material.dart';
import 'package:marker/pages/MyProfile.dart';
import 'package:marker/pages/attendance.dart';
import 'package:marker/pages/changePassword.dart';
import 'package:marker/pages/login.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'generateQr.dart';

int selected = 0;
class TeacherHome extends StatefulWidget {
  final Map data;
  TeacherHome({this.data});

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {

  Widget myDrawer(var wd, var ht){
    Map data = widget.data;
    return SafeArea(
      child: SizedBox(
        width: wd*0.7,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(wd*0.03, ht * 0.1, wd * 0.03, ht * 0.03),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/avatar.png"),
                      radius: 50.0,
                    ),
                    SizedBox(width: 20,),
                    AutoSizeText("${data['name']}",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          letterSpacing: 1.0
                      ),
                    ),
                  ],
                ),
              ),SizedBox(
                height: 30.0,
              ),
              FlatButton(
                color: Colors.grey[100],
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    selected = 0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5,),
                    Text("My Profile" ,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.grey[100],
                onPressed: () {
                  setState(() {
                    selected = 1;
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.reorder,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5,),
                    Text("Display QR Code",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.grey[100],
                onPressed: () {
                  setState(() {
                    selected = 2;
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5,),
                    Text("View Attendance",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.grey[100],
                onPressed: () {
                  setState(() {
                    selected = 3;
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5,),
                    Text("Change Password",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),SizedBox(height: 20.0,),
              Divider(
                color: Colors.grey[500],
              ),
              FlatButton(
                color: Colors.grey[100],
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Login()
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5,),
                    Text("Logout",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var ht = MediaQuery.of(context).size.height;
    Map data = widget.data;
    List<Widget> bWidgets = [
      MyProfile(data: widget.data,),
      GenerateQr(data: widget.data),
      Attendance(subId: int.parse(data['sub_id']),data: widget.data,),
      ChangePassword(data: widget.data),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Marker"),
        backgroundColor:Theme.of(context).primaryColor,
      ),
      drawer: myDrawer(wd,ht),
      body: bWidgets[selected],
//      body:
    );
  }
}
