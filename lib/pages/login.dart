import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginLoad.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username,password;
  final key = GlobalKey<FormState>();

  void submit(){
    if(key.currentState.validate()){
      key.currentState.save();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginLoad(data : {
            'uid': username,
            'password': password,
            'url': 'teacherLogin',
            'next':'TeacherHome'
          })
      ));
    }
  }

  void submitStudent(){
    if(key.currentState.validate()){
      key.currentState.save();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginLoad(data : {
            'uid': username,
            'password': password,
            'url': 'studentLogin',
            'next': 'StudentHome',
          })
      ));
    }
  }



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
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Form(
                      key: key,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'ID',
                              prefixIcon:  Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (String val) {
                              return val.isEmpty ? "Please enter your ID":null;
                            },
                            onSaved: (String val){
                              username = val;
                            },
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon:  Icon(Icons.vpn_key),
                            ),
                            obscureText: true,
                            validator: (String val) {
                              return val.isEmpty ? "Please enter your password":null;
                            },
                            onSaved: (String val){
                              password = val;
                            },
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                  RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      submitStudent();
                    },
                    child: Text(
                      'Login As Student',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue[700],
                    onPressed: () {
                      submit();
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