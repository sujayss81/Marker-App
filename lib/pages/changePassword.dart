import 'package:flutter/material.dart';
import 'package:http/http.dart';

String host = '10.0.2.2';

class ChangePassword extends StatefulWidget {
  final Map data;
  ChangePassword({this.data});
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String opass,npass;
  void getData() async
  {
    Map data = widget.data;
    Response res = await post('http://$host/changePassword',body: {
      'oldpassword' : opass,
      'newpassword' : npass,
      'e_id' : data['e_id']
    });
    if(res.statusCode == 200){
      showAlertDialog(context, "Password Changed Successfully");
    }
    else if(res.statusCode == 404){
      showAlertDialog(context, "Please enter your correct password");
    }
    else{
      showAlertDialog(context, "Something Went Wrong!! Please Check Your Internet Connection");
    }
  }
  showAlertDialog(BuildContext context,String message){
    String msg;
    AlertDialog alert;
    if(message!=null){
      msg = message;
      alert = AlertDialog(
        title: Text("Change Password"),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
    else{
      msg = "Are you sure you want top change the password?";
      alert = AlertDialog(
        title: Text("Change Password"),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              getData();
            },
            child: Text("Yes"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"),
          ),
        ],
      );
    }


    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    var _textEditController1 = TextEditingController();
    var _textEditController2 = TextEditingController();
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              controller: _textEditController1,
              obscureText: true,
              onChanged: (String str) => opass = str,
              decoration: InputDecoration(
                hintText: "Old Password",
              ),
            ),
            SizedBox(height: 30.0,),
            TextField(
              obscureText: true,
              controller: _textEditController2,
              textAlign: TextAlign.center,
              onChanged: (String str) => npass = str,
              decoration: InputDecoration(
                hintText: "New Password",
              ),
            ),SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: () {
                _textEditController1.clear();
                _textEditController2.clear();
                showAlertDialog(context,null);
              },
              color: Colors.red,
              child: Text("Change Password",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
