import 'package:flutter/material.dart';
import 'package:marker/pages/MyProfile.dart';
import 'package:marker/pages/attendance.dart';
import 'package:marker/pages/changePassword.dart';
import 'package:marker/pages/login.dart';
import 'package:marker/pages/preabs.dart';
import 'generateQr.dart';

int selected = 0;
class TeacherHome extends StatefulWidget {
  final Map data;
  TeacherHome({this.data});

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {

  Widget myDrawer(){
    Map data = widget.data;
    return SafeArea(
      child: SizedBox(
        width: 250.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 20.0),
                child: Text("Hello ${data['name']}",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey[600],
                      letterSpacing: 1.0
                  ),
                ),
              ),Divider(
                thickness: 1.0,
              ),
              SizedBox(
                width: 200.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      selected = 0;
                    });
                  },
                  child: Text("My Profile"),
                ),
              ),
              SizedBox(
                width: 200.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      selected = 1;
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Display QR Code"),
                ),
              ),SizedBox(
                width: 200,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      selected = 2;
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Attendance"),
                ),
              ),
              SizedBox(
                width: 200.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      selected = 3;
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Change Password"),
                ),
              ),
              SizedBox(
                width: 200.0,
                child: FlatButton(
                  onPressed: () {
                    selected = 0;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Login()
                    ));
                  },
                  child: Text("Logout"),
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
        backgroundColor: Colors.blueAccent,
      ),
      drawer: myDrawer(),
      body: bWidgets[selected],
//      body:
    );
  }
}
