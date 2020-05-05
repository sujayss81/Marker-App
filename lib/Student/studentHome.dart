import 'package:flutter/material.dart';
import 'package:marker/Student/password.dart';
import 'package:marker/Student/profile.dart';
import 'package:marker/Student/selectSub.dart';
import 'package:marker/pages/login.dart';

int selected = 0;
class StudentHome extends StatefulWidget {
  final Map data;
  StudentHome({this.data});
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {

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
                  child: Text("Scan QR Code"),
                ),
              ),
              SizedBox(
                width: 200.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      selected = 2;
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
      Profile(data: data),
      SelectSub(data: data),
      Password(data: data,)
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
