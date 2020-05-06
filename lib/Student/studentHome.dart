import 'package:flutter/material.dart';
import 'package:marker/Student/password.dart';
import 'package:marker/Student/profile.dart';
import 'package:marker/Student/selectSub.dart';
import 'package:marker/pages/login.dart';
import 'package:auto_size_text/auto_size_text.dart';

int selected = 0;
class StudentHome extends StatefulWidget {
  final Map data;
  StudentHome({this.data});
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Widget myDrawer(var wd,var ht){
    Map data = widget.data;
    return SafeArea(
      child: Container(
        width: wd*0.7,
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
                color: Theme.of(context).accentColor,
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
                    Icons.settings_overscan,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5,),
                  Text("Scan QR Code",
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
    );
  }

  @override
  Widget build(BuildContext context) {
  var wd = MediaQuery.of(context).size.width;
  var ht = MediaQuery.of(context).size.height;
    Map data = widget.data;
    List<Widget> bWidgets = [
      Profile(data: data),
      SelectSub(data: data),
      Password(data: data,)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Marker"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: myDrawer(wd,ht),
      body: bWidgets[selected],
//      body:
    );
  }
}
