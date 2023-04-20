import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marker/Student/studentHome.dart';
import 'package:marker/pages/login.dart';
import 'package:marker/pages/teacherHome.dart';

//Server 34.93.94.220
String host = '0454-117-200-105-133.ngrok-free.app';
class LoginLoad extends StatelessWidget {
  final Map data;
  LoginLoad({this.data});

  @override
  Widget build(BuildContext context) {
    Future<Widget> getData() async{
      if(data['next'] == 'TeacherHome') {
        Response res = await post(Uri.https(host, '/${data['url']}'),
            body: { 'e_id': data['uid'], 'password': data['password']});
        if (res.statusCode == 200) {
          Map obj = jsonDecode(res.body);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => TeacherHome(data: obj)
          ));
        }
        else {
          return AlertDialog(
            title: Text("Authentication Failed"),
            content: Text("Please Enter Correct Id/Password"),
            actions: <Widget>[
              TextButton(
                child: Center(child: Text("OK")),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Login()
                  ));
                },
              )
            ],
          );
        }
      }
      else{
        Response res = await post(Uri.https(host, '/${data['url']}'), body: { 'usn': data['uid'], 'password': data['password']});
        if (res.statusCode == 200) {
          Map obj = jsonDecode(res.body);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => StudentHome(data: obj)
          ));
        }
        else {
          return AlertDialog(
            title: Text("Authentication Failed"),
            content: Text("Please Enter Correct Id/Password"),
            actions: <Widget>[
              TextButton(
                child: Center(child: Text("OK")),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Login()
                  ));
                },
              )
            ],
          );
        }
      }
    }
    getData();
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context,snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return SpinKitThreeBounce(color: Colors.white,);
              default: if(snapshot.hasError){
                return  AlertDialog(
                  title: Text("Oops"),
                  content: Text("Something went wrong"),
                );
              }
              else{
                return Container(child: snapshot.data);
              }
            }
          },
        ),
      ),
    );
  }
}

