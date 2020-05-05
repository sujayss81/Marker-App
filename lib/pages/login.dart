import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'loginLoad.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username,password;


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  TextField(
                    onChanged: (String str) => username = str,
                    decoration: InputDecoration(
                      hintText: 'ID',
                      prefixIcon:  Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextField(
                    onChanged: (String str){
                      password = str;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon:  Icon(Icons.vpn_key),
                    ),
                  ),
                  SizedBox(height: 40,),
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginLoad(data : {
                            'uid': username,
                            'password': password,
                            'url': 'studentLogin',
                            'next': 'StudentHome',
                          })
                      ));
                    },
                    child: Text(
                      'Login As Student',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginLoad(data : {
                      'uid': username,
                      'password': password,
                      'url': 'teacherLogin',
                          'next':'TeacherHome'
                      })
                      ));
                    },
                    child: Text(
                      'Login As Teacher',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
