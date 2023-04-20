import 'package:flutter/material.dart';
import 'package:http/http.dart';
String host = '0454-117-200-105-133.ngrok-free.app';
class Password extends StatefulWidget {
  final Map data;
  Password({this.data});
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  String opass,npass;
  void getData() async
  {
    Map data = widget.data;
    Response res = await post(Uri.https(host, '/cPassword') ,body: {
      'oldpassword' : opass,
      'newpassword' : npass,
      'usn' : data['usn']
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
          TextButton(
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
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              getData();
            },
            child: Text("Yes"),
          ),
          TextButton(
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
            ElevatedButton(
              onPressed: () {
                _textEditController1.clear();
                _textEditController2.clear();
                showAlertDialog(context,null);
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
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
